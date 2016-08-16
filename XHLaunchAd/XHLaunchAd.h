//
//  XHLaunchAd.h
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIImageView+XHWebCache.h"

@class XHLaunchAd;

typedef void(^clickBlock)();
typedef void(^setAdImageBlock)(XHLaunchAd*launchAd);
typedef void(^showFinishBlock)();

@interface XHLaunchAd : UIViewController

/**
 *  广告frame
 */
@property (nonatomic, assign) CGRect adFrame;

/**
 *  显示启动广告
 *
 *  @param frame        广告frame
 *  @param hide         是否影藏倒计时按钮(默认:NO)
 *  @param setAdImage   设置AdImage回调
 *  @param click        广告点击事件回调
 *  @param showFinish   广告显示完成回调
 */
+(void)showWithAdFrame:(CGRect)frame hideSkip:(BOOL)hide setAdImage:(setAdImageBlock)setAdImage click:(clickBlock)click showFinish:(showFinishBlock)showFinish;

/**
 *  设置广告url图片
 *
 *  @param imgUrlString   图片url
 *  @param duration       广告停留时间
 *  @param options        图片缓存机制
 *  @param completedBlock 异步加载完图片回调
 */
-(void)imgUrlString:(NSString *)imgUrlString duration:(NSInteger)duration options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock;

/**
 *  清除图片本地缓存
 */
+(void)clearDiskCache;

/**
 *  获取缓存图片占用总大小(M)
 */
+(float)imagesCacheSize;

@end

