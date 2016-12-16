//
//  XHLaunchAdView.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/3.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdView.h"

@implementation XHLaunchAdView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
       self.userInteractionEnabled = YES;
       self.frame = [UIScreen mainScreen].bounds;
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(self.adClick) self.adClick();
}
@end


#pragma mark - imageAdView
@implementation XHLaunchImageAdView


@end

#pragma mark - videoAdView
@implementation XHLaunchVideoAdView

- (instancetype)init
{
    self = [super init];
    if (self) {
    
        [self addSubview:self.adVideoPlayer.view];
        [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    }
    return self;
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
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"frame"]) {
        
        _adVideoPlayer.view.frame =  self.frame;
    }
    
}

@end
