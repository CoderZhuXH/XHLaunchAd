//
//  XHLaunchAdConfiguratuon.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdConfiguratuon.h"

#pragma mark - 公共
@implementation XHLaunchAdConfiguratuon

@end

#pragma mark - 图片广告相关
@implementation XHLaunchImageAdConfiguratuon

+(XHLaunchImageAdConfiguratuon *)defaultConfiguratuon
{
    //配置广告数据
    XHLaunchImageAdConfiguratuon *configuratuon = [XHLaunchImageAdConfiguratuon new];
    //广告停留时间
    configuratuon.duration = 5;
    //广告frame
    configuratuon.frame = [UIScreen mainScreen].bounds;
    //缓存机制
    configuratuon.imageOption = XHLaunchAdImageDefault;
    //图片填充模式
    configuratuon.contentMode = UIViewContentModeScaleToFill;
    //广告显示完成动画
    configuratuon.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    configuratuon.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    configuratuon.showEnterForeground = NO;
    return configuratuon;
}
@end

#pragma mark - 视频广告相关
@implementation XHLaunchVideoAdConfiguratuon
+(XHLaunchVideoAdConfiguratuon *)defaultConfiguratuon
{
    //配置广告数据
    XHLaunchVideoAdConfiguratuon *configuratuon = [XHLaunchVideoAdConfiguratuon new];
    //广告停留时间
    configuratuon.duration = 5;
    //广告frame
    configuratuon.frame = [UIScreen mainScreen].bounds;
    //图片填充模式
    configuratuon.scalingMode = MPMovieScalingModeAspectFill;
    //广告显示完成动画
    configuratuon.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    configuratuon.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    configuratuon.showEnterForeground = NO;
    return configuratuon;
}
@end
