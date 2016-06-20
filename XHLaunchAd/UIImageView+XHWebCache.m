//
//  UIImageView+XHWebCache.m

//  Copyright (c) 2016 XHLaunchAd (https://github.com/CoderZhuXH/XHLaunchAd)

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "UIImageView+XHWebCache.h"
#import <CommonCrypto/CommonDigest.h>

#ifdef DEBUG
#define DebugLog(...) NSLog(__VA_ARGS__)
#else
#define DebugLog(...)
#endif

#pragma mark-XHWebImageDownloader

@interface XHWebImageDownloader()

@end

@implementation XHWebImageDownloader

+(void)xh_downLoadImage_asyncWithURL:(NSURL *)url options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock
{
    if(!options) options = XHWebImageDefault;
    if(options&XHWebImageOnlyLoad)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            UIImage *image = [self xh_downLoadImageWithURL:url];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(completedBlock)
                {
                    completedBlock(image,url);
                }
            });
        });
        
        return;
    }
    UIImage *image0 = [self xh_getCacheImageWithURL:url];
    if(image0&&completedBlock)
    {
        completedBlock(image0,url);
        
        if(options&XHWebImageDefault) return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *image = [self xh_downLoadImageWithURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(completedBlock)
            {
                completedBlock(image,url);
            }
        });
        
        [self xh_saveImage:image imageURL:url];
    });
}
+(UIImage *)xh_downLoadImageWithURL:(NSURL *)url{
    
    return [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    
}
+(UIImage *)xh_getCacheImageWithURL:(NSURL *)url
{
    if(!url) return nil;
    
    NSString *directoryPath = [self xh_cacheImagePath];
    NSString *path = [NSString stringWithFormat:@"%@/%@",
                      directoryPath,[self xh_md5String:url.absoluteString]];
    return [UIImage imageWithContentsOfFile:path];
    
}

+(void)xh_saveImage:(UIImage *)image imageURL:(NSURL *)url{
    
        NSData *data = UIImagePNGRepresentation(image);
        NSString *path = [NSString stringWithFormat:@"%@/%@",[self xh_cacheImagePath],[self xh_md5String:url.absoluteString]];
        if (data) {
            BOOL isOk = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];
            
            if (!isOk) DebugLog(@"cache file error for URL: %@", url);
        }
}
+ (NSString *)xh_cacheImagePath{
    
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Library/XHLaunchAdCache"];
    //DebugLog(@"XHLaunchAdCachePath:%@",path);
    [self xh_checkDirectory:path];
    return path;
    
}

+(void)xh_checkDirectory:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if (![fileManager fileExistsAtPath:path isDirectory:&isDir]) {
        [self xh_createBaseDirectoryAtPath:path];
    } else {
        if (!isDir) {
            NSError *error = nil;
            [fileManager removeItemAtPath:path error:&error];
            [self xh_createBaseDirectoryAtPath:path];
        }
    }
}

+ (void)xh_createBaseDirectoryAtPath:(NSString *)path {
    __autoreleasing NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES
                                               attributes:nil error:&error];
    if (error) {
        DebugLog(@"create cache directory failed, error = %@", error);
    } else {
        
        [self xh_addDoNotBackupAttribute:path];
    }
}
/**
 *  标记无需备份目录
 */
+ (void)xh_addDoNotBackupAttribute:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (error) {
        DebugLog(@"error to set do not backup attribute, error = %@", error);
    }
}
+ (NSString *)xh_md5String:(NSString *)string {
    
    if(string == nil || [string length] == 0)  return nil;
    
    const char *value = [string UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
}
@end

#pragma mark-XHwebCache
@implementation UIImageView (XHWebCache)

- (void)xh_setImageWithURL:(NSURL *)url
{
    [self xh_setImageWithURL:url placeholderImage:nil];
}
- (void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self xh_setImageWithURL:url placeholderImage:placeholder completed:nil];
}
- (void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(XHWebImageCompletionBlock)completedBlock
{
    [self xh_setImageWithURL:url placeholderImage:placeholder options:XHWebImageDefault completed:completedBlock];
}
-(void)xh_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock
{
    if(placeholder) self.image = placeholder;
    if(url)
    {
        __weak __typeof(self)wself = self;
        
        [XHWebImageDownloader xh_downLoadImage_asyncWithURL:url options:options completed:^(UIImage *image, NSURL *url) {
            
            if(!wself) return;
            
            wself.image = image;
            if(image&&completedBlock)
            {
                completedBlock(image,url);
            }
        }];
    }
}
@end
