//
//  XHLaunchAdCache.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/13.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdCache.h"
#import "XHLaunchAdConst.h"

@implementation XHLaunchAdCache

+(UIImage *)getCacheImageWithURL:(NSURL *)url
{
    if(url==nil) return nil;
    NSData *data = [NSData dataWithContentsOfFile:[self imagePathWithURL:url]];
    return [UIImage imageWithData:data];
}
+(NSData *)getCacheImageDataWithURL:(NSURL *)url
{
    if(url==nil) return nil;
    return [NSData dataWithContentsOfFile:[self imagePathWithURL:url]];
}
+(BOOL)saveImageData:(NSData *)data imageURL:(NSURL *)url{
    
    NSString *path = [NSString stringWithFormat:@"%@/%@",[self xhLaunchAdCachePath],XHMd5String(url.absoluteString)];
    if (data) {
        BOOL isOk = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];

        if (!isOk) XHLaunchAdLog(@"cache file error for URL: %@", url);
        
        return isOk;
    }
    return NO;
}
+(void)async_saveImageData:(NSData *)data imageURL:(NSURL *)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self saveImageData:data imageURL:url];
    });

}
+(nullable NSURL *)saveVideoAtLocation:(NSURL *)location URL:(NSURL *)url
{
    NSString *savePath = [[self xhLaunchAdCachePath] stringByAppendingPathComponent:XHVideoName(url.absoluteString)];
    NSURL *savePathUrl = [NSURL fileURLWithPath:savePath];
    
    BOOL result =[[NSFileManager defaultManager] moveItemAtURL:location toURL:savePathUrl error:nil];
    
    if (result) {
        
        return savePathUrl;
        
    }else{
        
        return nil;
    }
}
+(void)async_saveVideoAtLocation:(NSURL *)location URL:(NSURL *)url
{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [self saveVideoAtLocation:location URL:url];
    });

}
+(nullable NSURL *)getCacheVideoWithURL:(NSURL *)url
{
    NSString *savePath = [[self xhLaunchAdCachePath] stringByAppendingPathComponent:XHVideoName(url.absoluteString)];
    //如果存在
    if([[NSFileManager defaultManager] fileExistsAtPath:savePath])
    {
        return [NSURL fileURLWithPath:savePath];
    }
    return nil;
}
+ (NSString *)xhLaunchAdCachePath{
    
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Library/XHLaunchAdCache"];
    [self checkDirectory:path];
    return path;
    
}

+(NSString *)imagePathWithURL:(NSURL *)url
{
    if(url==nil) return nil;
    return [[self xhLaunchAdCachePath] stringByAppendingPathComponent:XHMd5String(url.absoluteString)];
}
+(NSString *)videoPathWithURL:(NSURL *)url
{
    if(url==nil) return nil;
    return [[self xhLaunchAdCachePath] stringByAppendingPathComponent:XHVideoName(url.absoluteString)];
}
+(BOOL)checkImageInCacheWithURL:(NSURL *)url
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[self imagePathWithURL:url]];
}
+(BOOL)checkVideoInCacheWithURL:(NSURL *)url
{
    return [[NSFileManager defaultManager] fileExistsAtPath:[self videoPathWithURL:url]];
}
+(void)checkDirectory:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir;
    if (![fileManager fileExistsAtPath:path isDirectory:&isDir]) {
        [self createBaseDirectoryAtPath:path];
    } else {
        if (!isDir) {
            NSError *error = nil;
            [fileManager removeItemAtPath:path error:&error];
            [self createBaseDirectoryAtPath:path];
        }
    }
}
#pragma mark - url缓存
+(void)async_saveImageUrl:(NSString *)url{
    
    if(url==nil) return;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
       
        [[NSUserDefaults standardUserDefaults] setObject:url forKey:XHCacheImageUrlStringKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });

}
+(NSString *)getCacheImageUrl{

   return [[NSUserDefaults standardUserDefaults] objectForKey:XHCacheImageUrlStringKey];
}
+(void)async_saveVideoUrl:(NSString *)url{

    if(url==nil) return;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        [[NSUserDefaults standardUserDefaults] setObject:url forKey:XHCacheVideoUrlStringKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    });

}
+(NSString *)getCacheVideoUrl
{
  return [[NSUserDefaults standardUserDefaults] objectForKey:XHCacheVideoUrlStringKey];
}

#pragma mark - 其他
+(void)clearDiskCache
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [self xhLaunchAdCachePath];
        [fileManager removeItemAtPath:path error:nil];
        [self checkDirectory:[self xhLaunchAdCachePath]];
        
    });

}

+(float)diskCacheSize
{
    NSString *directoryPath = [self xhLaunchAdCachePath];
    BOOL isDir = NO;
    unsigned long long total = 0;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDir]) {
        if (isDir) {
            NSError *error = nil;
            NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:&error];
            
            if (error == nil) {
                for (NSString *subpath in array) {
                    NSString *path = [directoryPath stringByAppendingPathComponent:subpath];
                    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:path
                                                                                          error:&error];
                    if (!error) {
                        total += [dict[NSFileSize] unsignedIntegerValue];
                    }
                }
            }
        }
    }
    return total/(1024.0*1024.0);

}

+ (void)createBaseDirectoryAtPath:(NSString *)path {
    __autoreleasing NSError *error = nil;
    [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES
                                               attributes:nil error:&error];
    if (error) {
        XHLaunchAdLog(@"create cache directory failed, error = %@", error);
    } else {
        XHLaunchAdLog(@"XHLaunchAdCachePath:%@",path);
        [self addDoNotBackupAttribute:path];
    }
}

+ (void)addDoNotBackupAttribute:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (error) {
        XHLaunchAdLog(@"error to set do not backup attribute, error = %@", error);
    }
}
@end
