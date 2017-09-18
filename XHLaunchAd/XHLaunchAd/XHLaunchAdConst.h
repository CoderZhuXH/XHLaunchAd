//
//  XHLaunchAdConst.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2017/9/18.
//  Copyright © 2017年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

/** 弱引用 */
#define XHWeakSelf __weak typeof(self) weakSelf = self;

/** 日志输出 */
#ifdef DEBUG
#define XHLaunchAdLog(...) NSLog(__VA_ARGS__)
#else
#define XHLaunchAdLog(...)
#endif

/** MD5 */
#define XHMd5String(string)\
({\
NSString *md5String = @"";\
const char *value = [string UTF8String];\
unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];\
CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);\
NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];\
for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){\
    [outputString appendFormat:@"%02x",outputBuffer[count]];\
}\
md5String = outputString;\
(md5String);\
})

#define XHISGIFTypeWithData(data)\
({\
BOOL result = NO;\
if(!data) result = NO;\
uint8_t c;\
[data getBytes:&c length:1];\
if(c == 0x47) result = YES;\
(result);\
})

#define XHDataWithFileName(name)\
({\
NSData *data = nil;\
NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];\
if([[NSFileManager defaultManager] fileExistsAtPath:path]){\
    data = [NSData dataWithContentsOfFile:path];\
}\
(data);\
})

#define DISPATCH_SOURCE_CANCEL_SAFE(time) if(time)\
{\
dispatch_source_cancel(time);\
time = nil;\
}

#define REMOVE_FROM_SUPERVIEW_SAFE(view) if(view)\
{\
[view removeFromSuperview];\
view = nil;\
}

#define XHVideoName(string) [XHMd5String(string) stringByAppendingString:@".mp4"]
#define XHISURLString(string)  ([string hasPrefix:@"https://"] || [string hasPrefix:@"http://"]) ? YES:NO
#define XHStringContainsSubString(string,subString)  ([string rangeOfString:subString].location == NSNotFound) ? NO:YES


UIKIT_EXTERN NSString *const XHCacheImageUrlStringKey;
UIKIT_EXTERN NSString *const XHCacheVideoUrlStringKey;




