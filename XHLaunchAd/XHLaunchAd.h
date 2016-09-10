//
//  XHLaunchAd.h
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

//  特性:
//  1.支持全屏/半屏广告.
//  2.支持静态/动态广告.
//  3.兼容iPhone和iPad.
//  4.支持广告点击事件
//  5.自带图片下载,缓存功能.
//  6.支持设置未检测到广告数据,启动页停留时间
//  7.无依赖其他第三方框架.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIImageView+XHWebCache.h"

/**
 *  定义一个weakLaunchAd
 */
#define WEAKLAUNCHAD  __weak __typeof(launchAd) weakLaunchAd = launchAd;

/**
 *  倒计时类型
 */
typedef NS_ENUM(NSInteger,SkipType) {
    
    SkipTypeNone      = 1,//无
    SkipTypeTime      = 2,//倒计时
    SkipTypeText      = 3,//跳过
    SkipTypeTimeText  = 4,//倒计时+跳过
    
};

@class XHLaunchAd;

typedef void(^clickBlock)();
typedef void(^setAdImageBlock)(XHLaunchAd*launchAd);
typedef void(^showFinishBlock)();

@interface XHLaunchAd : UIViewController

/**
 *  未检测到广告数据,启动页停留时间(默认3s)(最小1s)
 *  请在向服务器请求广告数据前,设置此属性
 */
@property (nonatomic, assign) NSInteger noDataDuration;

/**
 *  重置广告frame
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
 *  @param duration       广告停留时间(小于等于0s,默认按5s处理)
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

