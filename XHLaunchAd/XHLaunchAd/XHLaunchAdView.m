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
@implementation XHLaunchAdVideoView
-(void)dealloc
{
    [self removeObserver:self forKeyPath:@"frame"];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.frame = [UIScreen mainScreen].bounds;
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tapGesture];
        
        [self addSubview:self.adVideoPlayer.view];
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        
    }
    return self;
}
-(void)tap:(UIGestureRecognizer *)gestureRecognizer
{
     if(self.click) self.click();
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
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"]) {
        
        _adVideoPlayer.view.frame =  self.frame;
    }
}

@end

