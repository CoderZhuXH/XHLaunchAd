//
//  XHLaunchAdView.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/3.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>

@interface XHLaunchAdView : UIImageView

@property(nonatomic,copy,nonnull) void(^adClick)();

@end

#pragma mark - imageAdView
@interface XHLaunchImageAdView : XHLaunchAdView

@end

#pragma mark - videoAdView
@interface XHLaunchVideoAdView : XHLaunchAdView

@property (strong, nonatomic,nonnull) MPMoviePlayerController *adVideoPlayer;
@property(nonatomic,assign)MPMovieScalingMode adVideoScalingMode;

@end
