//
//  XHLaunchAdConst.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2017/9/18.
//  Copyright © 2017年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>

#define XHLaunchAdDeprecated(instead) __attribute__((deprecated(instead)))

#define XHWeakSelf __weak typeof(self) weakSelf = self;

#define XH_ScreenW    [UIScreen mainScreen].bounds.size.width
#define XH_ScreenH    [UIScreen mainScreen].bounds.size.height

#define XH_IPHONEX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define XH_IPHONEXR    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define XH_IPHONEXSMAX    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
#define XH_FULLSCREEN ((XH_IPHONEX || XH_IPHONEXR || XH_IPHONEXSMAX) ? YES : NO)


#define XHISURLString(string)  ([string hasPrefix:@"https://"] || [string hasPrefix:@"http://"]) ? YES:NO
#define XHStringContainsSubString(string,subString)  ([string rangeOfString:subString].location == NSNotFound) ? NO:YES

#ifdef DEBUG
#define XHLaunchAdLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define XHLaunchAdLog(...)
#endif

#define XHISGIFTypeWithData(data)\
({\
BOOL result = NO;\
if(!data) result = NO;\
uint8_t c;\
[data getBytes:&c length:1];\
if(c == 0x47) result = YES;\
(result);\
})

#define XHISVideoTypeWithPath(path)\
({\
BOOL result = NO;\
if([path hasSuffix:@".mp4"])  result =  YES;\
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

UIKIT_EXTERN NSString *const XHCacheImageUrlStringKey;
UIKIT_EXTERN NSString *const XHCacheVideoUrlStringKey;

UIKIT_EXTERN NSString *const XHLaunchAdWaitDataDurationArriveNotification;
UIKIT_EXTERN NSString *const XHLaunchAdDetailPageWillShowNotification;
UIKIT_EXTERN NSString *const XHLaunchAdDetailPageShowFinishNotification;
/** GIFImageCycleOnce = YES(GIF不循环)时, GIF动图播放完成通知 */
UIKIT_EXTERN NSString *const XHLaunchAdGIFImageCycleOnceFinishNotification;
/** videoCycleOnce = YES(视频不循环时) ,video播放完成通知 */
UIKIT_EXTERN NSString *const XHLaunchAdVideoCycleOnceFinishNotification;
/** 视频播放失败通知 */
UIKIT_EXTERN NSString *const XHLaunchAdVideoPlayFailedNotification;
UIKIT_EXTERN BOOL XHLaunchAdPrefersHomeIndicatorAutoHidden;



