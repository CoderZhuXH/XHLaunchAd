//
//  XHLaunchAdView.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/12/3.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdView.h"
#import "XHLaunchAdConst.h"
#import "XHLaunchImageView.h"

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
@property (nonatomic, strong) AVPlayerItem *playerItem;
@end

@implementation XHLaunchAdVideoView

-(void)dealloc{
    [self.playerItem removeObserver:self forKeyPath:@"status"];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
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

#pragma mark - Action
-(void)stopVideoPlayer{
    if(_videoPlayer==nil) return;
    [_videoPlayer.player pause];
    [_videoPlayer.view removeFromSuperview];
    _videoPlayer = nil;
}

- (void)runLoopTheMovie:(NSNotification *)notification{
    //需要循环播放
    if(!_videoCycleOnce){
        [(AVPlayerItem *)[notification object] seekToTime:kCMTimeZero];
        [self.videoPlayer.player play];//重播
    }
}
#pragma mark - lazy
-(AVPlayerViewController *)videoPlayer{
    if(_videoPlayer==nil){
        _videoPlayer = [[AVPlayerViewController alloc] init];
        _videoPlayer.showsPlaybackControls = NO;
        _videoPlayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _videoPlayer.view.frame = [UIScreen mainScreen].bounds;
        _videoPlayer.view.backgroundColor = [UIColor clearColor];
        //注册通知控制是否循环播放
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(runLoopTheMovie:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return _videoPlayer;
}
#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSInteger newStatus = ((NSNumber *)change[@"new"]).integerValue;
    if (newStatus == AVPlayerItemStatusFailed) {
        [[NSNotificationCenter defaultCenter] postNotificationName:XHLaunchAdVideoPlayFailedNotification object:_contentURL ?: nil];
    }
}
#pragma mark - set
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _videoPlayer.view.frame = self.frame;
}

- (void)setContentURL:(NSURL *)contentURL {
    _contentURL = contentURL;
    AVAsset *movieAsset = [AVURLAsset URLAssetWithURL:contentURL options:nil];
    AVPlayerItem * playerItem = [AVPlayerItem playerItemWithAsset:movieAsset];
    self.videoPlayer.player = [AVPlayer playerWithPlayerItem:playerItem];
    // 监听播放失败
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    self.playerItem = playerItem;
}
-(void)setVideoGravity:(AVLayerVideoGravity)videoGravity{
    _videoGravity = videoGravity;
    _videoPlayer.videoGravity = videoGravity;
}
-(void)setVideoScalingMode:(MPMovieScalingMode)videoScalingMode{
    _videoScalingMode = videoScalingMode;
    switch (_videoScalingMode) {
        case MPMovieScalingModeNone:{
            _videoPlayer.videoGravity = AVLayerVideoGravityResizeAspect;
        }
            break;
        case MPMovieScalingModeAspectFit:{
            _videoPlayer.videoGravity = AVLayerVideoGravityResizeAspect;
        }
            break;
        case MPMovieScalingModeAspectFill:{
            _videoPlayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        }
            break;
        case MPMovieScalingModeFill:{
            _videoPlayer.videoGravity = AVLayerVideoGravityResize;
        }
            break;
        default:
            break;
    }
}

@end

