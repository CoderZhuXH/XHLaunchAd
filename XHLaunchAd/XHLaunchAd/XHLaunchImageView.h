//
//  XHLaunchImageView.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>

/** 启动图来源 */
typedef NS_ENUM(NSInteger,SourceType) {
    /** LaunchImage(default) */
    SourceTypeLaunchImage = 1,
    /** LaunchScreen.storyboard */
    SourceTypeLaunchScreen = 2,
};

typedef NS_ENUM(NSInteger,LaunchImagesSource){
    LaunchImagesSourceLaunchImage = 1,
    LaunchImagesSourceLaunchScreen = 2,
};

@interface XHLaunchImageView : UIImageView

- (instancetype)initWithSourceType:(SourceType)sourceType;

@end
