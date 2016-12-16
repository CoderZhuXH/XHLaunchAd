//
//  XHLaunchAdConfiguration.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XHLaunchAdButton.h"
#import "UIImageView+XHLaunchAdCache.h"
#import <MediaPlayer/MediaPlayer.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  显示完成动画
 */
typedef NS_ENUM(NSInteger , ShowFinishAnimate) {
    
    /**
     *  无
     */
    ShowFinishAnimateNone = 1,
    /**
     *  普通淡入(default)
     */
    ShowFinishAnimateFadein = 2,
    /**
     *  放大淡入
     */
    ShowFinishAnimateLite = 3
    
};

#pragma mark - 公共属性
@interface XHLaunchAdConfiguration : NSObject

/**
 *  停留时间(default 5)
 */
@property(nonatomic,assign)NSInteger duration;

/**
 *  跳过按钮类型(default SkipTypeTimeText)
 */
@property(nonatomic,assign)SkipType skipButtonType;

/**
 *  显示完成动画(default ShowFinishAnimateFadein)
 */
@property(nonatomic,assign)ShowFinishAnimate showFinishAnimate;

/**
 *  设置开屏广告的frame(default [UIScreen mainScreen].bounds)
 */
@property (nonatomic,assign) CGRect frame;

/**
 *  程序从后台恢复时,是否需要展示广告(defailt NO)
 */
@property (nonatomic,assign) BOOL showEnterForeground;

/**
 *  点击打开页面地址
 */
@property(nonatomic,copy)NSString *openURLString;

/**
 *  自定义跳过按钮(若定义此视图,将会自定替换系统跳过按钮)
 */
@property(nonatomic,strong) UIView *customSkipView;

/**
 *  子视图(若定义此属性,这些视图将会被自动添加在广告视图上)
 */
@property(nonatomic,copy,nullable) NSArray<UIView *> *subViews;

@end

#pragma mark - 图片广告相关
@interface XHLaunchImageAdConfiguration : XHLaunchAdConfiguration

/**
 *  图片广告缩放模式(default UIViewContentModeScaleToFill)
 */
@property(nonatomic,assign)UIViewContentMode contentMode;

/**
 *  image本地图片名(jpg/gif图片请带上扩展名)或网络图片URL string
 */
@property(nonatomic,copy)NSString *imageNameOrURLString;

/**
 *  缓存机制(default XHLaunchImageDefault)
 */
@property(nonatomic,assign)XHLaunchAdImageOptions imageOption;


+(XHLaunchImageAdConfiguration *)defaultConfiguration;


@end

#pragma mark - 视频广告相关
@interface XHLaunchVideoAdConfiguration : XHLaunchAdConfiguration

/**
 *  video本地名或网络链接URL string
 */
@property(nonatomic,copy)NSString *videoNameOrURLString;

/**
 *  视频缩放模式(default MPMovieScalingModeAspectFill)
 */
@property(nonatomic,assign)MPMovieScalingMode scalingMode;

+(XHLaunchVideoAdConfiguration *)defaultConfiguration;

@end

NS_ASSUME_NONNULL_END
