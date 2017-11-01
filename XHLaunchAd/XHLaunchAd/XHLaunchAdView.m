//
//  XHLaunchAdView.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/3.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdView.h"

@interface XHLaunchAdImageView ()

@end
@implementation XHLaunchAdImageView

- (id)init{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.frame = [UIScreen mainScreen].bounds;
        self.layer.masksToBounds = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)tap:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint point = [gestureRecognizer locationInView:self];
    if(self.click) self.click(point);
}

@end

#pragma mark - videoAdView
@interface XHLaunchAdVideoView ()<UIGestureRecognizerDelegate>

@end

@implementation XHLaunchAdVideoView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.frame = [UIScreen mainScreen].bounds;
        [self addSubview:self.videoPlayer.view];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapGesture.delegate = self;
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)tap:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint point = [gestureRecognizer locationInView:self];
    if(self.click) self.click(point);
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

-(void)setVideoScalingMode:(MPMovieScalingMode)videoScalingMode{
    _videoScalingMode = videoScalingMode;
    _videoPlayer.scalingMode  = videoScalingMode;
}

-(MPMoviePlayerController *)videoPlayer{
    if(_videoPlayer==nil){
        _videoPlayer = [[MPMoviePlayerController alloc] init];
        _videoPlayer.shouldAutoplay = YES;
        [_videoPlayer setControlStyle:MPMovieControlStyleNone];
        _videoPlayer.repeatMode = MPMovieRepeatModeOne;
        _videoPlayer.scalingMode  = MPMovieScalingModeAspectFill;
        _videoPlayer.view.frame = [UIScreen mainScreen].bounds;
        _videoPlayer.view.backgroundColor = [UIColor whiteColor];
        _videoPlayer.backgroundView.backgroundColor = [UIColor whiteColor];
    }
    return _videoPlayer;
}

-(void)stopVideoPlayer{
    if(_videoPlayer==nil) return;
    [_videoPlayer stop];
    [_videoPlayer.view removeFromSuperview];
    _videoPlayer = nil;
}

#pragma mark - set
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _videoPlayer.view.frame = self.frame;
}

-(void)setVideoCycleOnce:(BOOL)videoCycleOnce{
    _videoCycleOnce = videoCycleOnce;
    if(videoCycleOnce){
         _videoPlayer.repeatMode = MPMovieRepeatModeNone;
    }else{
         _videoPlayer.repeatMode = MPMovieRepeatModeOne;
    }
}

@end

