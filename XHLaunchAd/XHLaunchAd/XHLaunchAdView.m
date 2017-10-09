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

- (id)init
{
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
-(void)tap:(UIGestureRecognizer *)gestureRecognizer
{
    if(self.click) self.click();
}

@end

#pragma mark - videoAdView
@interface XHLaunchAdVideoView ()<UIGestureRecognizerDelegate>

@end

@implementation XHLaunchAdVideoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.frame = [UIScreen mainScreen].bounds;

        [self addSubview:self.adVideoPlayer.view];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tapGesture.delegate = self;
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}
-(void)tap:(UIGestureRecognizer *)gestureRecognizer
{
     if(self.click) self.click();
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
-(void)setAdVideoScalingMode:(MPMovieScalingMode)adVideoScalingMode
{
    _adVideoScalingMode = adVideoScalingMode;
    _adVideoPlayer.scalingMode  = adVideoScalingMode;
}
-(MPMoviePlayerController *)adVideoPlayer
{
    if(_adVideoPlayer==nil)
    {
        _adVideoPlayer = [[MPMoviePlayerController alloc] init];
        _adVideoPlayer.shouldAutoplay = YES;
        [_adVideoPlayer setControlStyle:MPMovieControlStyleNone];
        _adVideoPlayer.repeatMode = MPMovieRepeatModeNone;
        _adVideoPlayer.scalingMode  = MPMovieScalingModeAspectFill;
        _adVideoPlayer.view.frame = [UIScreen mainScreen].bounds;
        _adVideoPlayer.view.backgroundColor = [UIColor clearColor];
    }
    return _adVideoPlayer;
    
}
-(void)stopVideoPlayer{

    if(_adVideoPlayer==nil) return;
    [_adVideoPlayer stop];
    [_adVideoPlayer.view removeFromSuperview];
    _adVideoPlayer = nil;

}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _adVideoPlayer.view.frame = self.frame;
}

@end

