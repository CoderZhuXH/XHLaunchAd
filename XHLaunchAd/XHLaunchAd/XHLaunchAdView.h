//
//  XHLaunchAdView.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/3.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
#import "FLAnimatedImage.h"
#import "FLAnimatedImageView.h"

#pragma mark - image
@interface XHLaunchAdImageView : FLAnimatedImageView

@property (nonatomic, copy) void(^click)();

@end

#pragma mark - video
@interface XHLaunchAdVideoView : UIView

@property (nonatomic, copy) void(^click)();
@property (strong, nonatomic) MPMoviePlayerController *adVideoPlayer;
@property(nonatomic,assign)MPMovieScalingMode adVideoScalingMode;
-(void)stopVideoPlayer;

@end

