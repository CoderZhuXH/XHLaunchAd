//
//  XHImageCache.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHImageCache.h"
#import <CommonCrypto/CommonDigest.h>
#import "UIImage+XHGIF.h"

@implementation XHImageCache

+(UIImage *)xh_getCacheImageWithURL:(NSURL *)url
{
    if(url==nil) return nil;
    
    NSString *directoryPath = [self xh_cacheImagePath];
    NSString *path = [NSString stringWithFormat:@"%@/%@",
                      directoryPath,[self xh_md5String:url.absoluteString]];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [UIImage xh_animatedGIFWithData:data];
}

+(void)xh_saveImageData:(NSData *)data imageURL:(NSURL *)url{
    
    NSString *path = [NSString stringWithFormat:@"%@/%@",[self xh_cacheImagePath],[self xh_md5String:url.absoluteString]];
    if (data) {
        BOOL isOk = [[NSFileManager defaultManager] createFileAtPath:path contents:data attributes:nil];

        if (!isOk) NSLog(@"cache file error for URL: %@", url);
    }
}
+ (NSString *)xh_cacheImagePath{
    
    NSString *path =[NSHomeDirectory() stringByAppendingPathComponent:@"Library/XHLaunchAdCache"];
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
        NSLog(@"create cache directory failed, error = %@", error);
    } else {
        NSLog(@"XHLaunchAdCachePath:%@",path);
        [self xh_addDoNotBackupAttribute:path];
    }
}

+ (void)xh_addDoNotBackupAttribute:(NSString *)path {
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error = nil;
    [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (error) {
        NSLog(@"error to set do not backup attribute, error = %@", error);
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
