//
//  NSString+XHLaunchAd.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/26.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "NSString+XHLaunchAd.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (XHLaunchAd)

-(BOOL)xh_isURLString
{
    if([self hasPrefix:@"https://"]|| [self hasPrefix:@"http://"]) return YES;
    return NO;
}
-(NSString *)xh_videoName
{
//    NSString *name = [[self componentsSeparatedByString:@"/"] lastObject];
//    if([name xh_containsSubString:@"."])
//    {
//        NSString * extensionName = [[name componentsSeparatedByString:@"."] lastObject];
//        NSString *md5Name = [self.xh_md5String stringByAppendingString:extensionName];
//        return md5Name;
//    }
    return [self.xh_md5String stringByAppendingString:@".mp4"];
}
-(NSString *)xh_md5String
{
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    return outputString;
    
}
-(BOOL)xh_containsSubString:(nonnull NSString *)subString
{
    if(subString==nil) return NO;
    if([self rangeOfString:subString].location ==NSNotFound) return NO;
    return YES;
}

@end
