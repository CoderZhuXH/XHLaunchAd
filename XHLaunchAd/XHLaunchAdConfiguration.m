//
//  XHLaunchAdConfiguration.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdConfiguration.h"

#pragma mark - 公共
@implementation XHLaunchAdConfiguration

@end

#pragma mark - 图片广告相关
@implementation XHLaunchImageAdConfiguration

+(XHLaunchImageAdConfiguration *)defaultConfiguration
{
    //配置广告数据
    XHLaunchImageAdConfiguration *configuration = [XHLaunchImageAdConfiguration new];
    //广告停留时间
    configuration.duration = 5;
    //广告frame
    configuration.frame = [UIScreen mainScreen].bounds;
    //缓存机制
    configuration.imageOption = XHLaunchAdImageDefault;
    //图片填充模式
    configuration.contentMode = UIViewContentModeScaleToFill;
    //广告显示完成动画
    configuration.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    configuration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    configuration.showEnterForeground = NO;
    return configuration;
}
@end

#pragma mark - 视频广告相关
@implementation XHLaunchVideoAdConfiguration
+(XHLaunchVideoAdConfiguration *)defaultConfiguration
{
    //配置广告数据
    XHLaunchVideoAdConfiguration *configuration = [XHLaunchVideoAdConfiguration new];
    //广告停留时间
    configuration.duration = 5;
    //广告frame
    configuration.frame = [UIScreen mainScreen].bounds;
    //视频填充模式
    configuration.scalingMode = MPMovieScalingModeAspectFill;
    //广告显示完成动画
    configuration.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    configuration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    configuration.showEnterForeground = NO;
    return configuration;
}
@end
