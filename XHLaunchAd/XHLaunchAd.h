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

typedef NS_ENUM(NSInteger,SkipType) {
    
    SkipTypeNone      = 0,//无
    SkipTypeTime      = 1,//跳过
    SkipTypeText      = 2,//倒计时
    SkipTypeTimeText  = 3,//倒计时+跳过
    
};

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
 *  @param frame      广告frame
 *  @param setAdImage 设置AdImage回调
 *  @param showFinish 广告显示完成回调
 */
+(void)showWithAdFrame:(CGRect)frame setAdImage:(setAdImageBlock)setAdImage showFinish:(showFinishBlock)showFinish;

/**
 *  设置广告数据
 *
 *  @param imageUrl       图片url
 *  @param duration       广告停留时间
 *  @param skipType       跳过按钮类型
 *  @param options        图片缓存机制
 *  @param completedBlock 异步加载完图片回调
 *  @param click          广告点击事件回调
 */
-(void)setImageUrl:(NSString*)imageUrl duration:(NSInteger)duration skipType:(SkipType)skipType options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock click:(clickBlock)click;

/**
 *  清除图片本地缓存
 */
+(void)clearDiskCache;

/**
 *  获取缓存图片占用总大小(M)
 */
+(float)imagesCacheSize;

@end

