//
//  XHLaunchAd.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAd.h"
#import "XHImageCache.h"


/**
 *  未检测到广告数据,启动页默认停留时间
 */
static NSInteger const noDataDefaultDuration = 3;

@interface XHLaunchAd()

@property(nonatomic,strong)UIImageView *launchImgView;
@property(nonatomic,strong)UIImageView *adImgView;
@property(nonatomic,strong)XHSkipButton *skipButton;
@property(nonatomic,assign)NSInteger duration;
@property(nonatomic,copy)dispatch_source_t noDataTimer;
@property(nonatomic,copy)dispatch_source_t skipButtonTimer;
@property(nonatomic,copy)showFinishBlock showFinishBlock;
@property(nonatomic,copy)clickBlock clickBlock;
@property(nonatomic,assign)SkipType skipType;
@property(nonatomic,assign)BOOL isShowFinish;
@property(nonatomic,assign)BOOL isClick;
@end
@implementation XHLaunchAd

+(void)showWithAdFrame:(CGRect)frame setAdImage:(setAdImageBlock)setAdImage showFinish:(showFinishBlock)showFinish
{
    XHLaunchAd *AdVC = [[XHLaunchAd alloc] initWithFrame:frame showFinish:showFinish];
    [[UIApplication sharedApplication].delegate window].rootViewController = AdVC;
    if(setAdImage) setAdImage(AdVC);
}

-(void)setImageUrl:(NSString *)imageUrl duration:(NSInteger)duration skipType:(SkipType)skipType options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock click:(clickBlock)click
{
    if(_isShowFinish) return;
    if([self imageUrlError:imageUrl]) return;
    if(options&XHWebImageCacheInBackground)
    {
        UIImage *cacheImage = [XHImageCache xh_getCacheImageWithURL:[NSURL URLWithString:imageUrl]];
        if(cacheImage==nil)
        {
            if(_noDataTimer) dispatch_source_cancel(_noDataTimer);
            [[UIImageView new] xh_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:options completed:nil];
            [self remove];
            return;
        }
    }
    _duration = duration;
    _skipType = skipType;
    _clickBlock = [click copy];
    [self setupAdImgViewAndSkipButton];
    [_adImgView xh_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil options:options completed:completedBlock];
}

+(void)clearDiskCache
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *path = [XHImageCache xh_cacheImagePath];
        [fileManager removeItemAtPath:path error:nil];
        [XHImageCache xh_checkDirectory:[XHImageCache xh_cacheImagePath]];
        
    });
}

+(float)imagesCacheSize {
    NSString *directoryPath = [XHImageCache xh_cacheImagePath];
    BOOL isDir = NO;
    unsigned long long total = 0;
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:directoryPath isDirectory:&isDir]) {
        if (isDir) {
            NSError *error = nil;
            NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:&error];
            
            if (error == nil) {
                for (NSString *subpath in array) {
                    NSString *path = [directoryPath stringByAppendingPathComponent:subpath];
                    NSDictionary *dict = [[NSFileManager defaultManager] attributesOfItemAtPath:path
                                                                                          error:&error];
                    if (!error) {
                        total += [dict[NSFileSize] unsignedIntegerValue];
                    }
                }
            }
        }
    }
    return total/(1024.0*1024.0);
}

#pragma mark- private

- (instancetype)initWithFrame:(CGRect)frame showFinish:(void(^)())showFinish
{
    self = [super init];
    if (self) {
        
        _adFrame = frame;
        _noDataDuration = noDataDefaultDuration;
        _showFinishBlock = [showFinish copy];
        [self.view addSubview:self.launchImgView];
        [self startNoDataDispath_tiemr];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    if(_skipButtonTimer&&_duration>0&&self.isClick)
    {
      dispatch_resume(_skipButtonTimer);
    }
    self.isClick = NO;
}
-(void)viewWillDisappear:(BOOL)animated
{
    if(_skipButtonTimer&&_duration>0&&self.isClick)
    {
        dispatch_suspend(_skipButtonTimer);
    }
}
-(void)dealloc
{
    //NSLog(@"广告视图销毁");
}
-(BOOL)imageUrlError:(NSString *)imageUrl
{
    if(imageUrl==nil || imageUrl.length==0 || ![imageUrl hasPrefix:@"http"])
    {
        NSLog(@"图片URL地址为nil,或者有误!");
        return YES;
    }
    
    return  NO;
}
-(void)setupAdImgViewAndSkipButton
{
    [self.view addSubview:self.adImgView];
    [self.view addSubview:self.skipButton];
    [self animateStart];
}

-(UIImageView *)launchImgView
{
    if(_launchImgView==nil)
    {
        _launchImgView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _launchImgView.image = [self getLaunchImage];
    }
    return _launchImgView;
}

-(UIImageView *)adImgView
{
    if(_adImgView==nil)
    {
        _adImgView = [[UIImageView alloc] initWithFrame:_adFrame];
        _adImgView.userInteractionEnabled = YES;
        _adImgView.alpha = 0.2;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [_adImgView addGestureRecognizer:tap];
    }
    return _adImgView;
}

-(XHSkipButton *)skipButton
{
    if(_skipButton == nil)
    {
        _skipButton = [[XHSkipButton alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-70,25, 70, 40)];
        [_skipButton addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
        _skipButton.leftRightSpace = 5;
        _skipButton.topBottomSpace = 5;
        if(!_duration||_duration<=0) _duration = 5;//停留时间传nil或<=0,默认5s
        if(!_skipType) _skipType = SkipTypeTimeText;//类型传nil,默认TimeText
        [_skipButton xh_stateWithskipType:_skipType andDuration:_duration];
        [self startSkipButtonTimer];
    }
    return _skipButton;
}
-(void)animateStart
{
    CGFloat duration = _duration;
    duration= duration/4.0;
    if(duration>1.0) duration=1.0;
    [UIView animateWithDuration:duration animations:^{
        
        self.adImgView.alpha = 1;
        
    } completion:^(BOOL finished) {
    }];
}

-(void)startNoDataDispath_tiemr
{
    NSTimeInterval period = 1.0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _noDataTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_noDataTimer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    
    __block NSInteger duration = _noDataDuration;
    dispatch_source_set_event_handler(_noDataTimer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(duration==0)
            {
                dispatch_source_cancel(_noDataTimer);
                
                [self remove];
            }
            duration--;
        });
    });
    dispatch_resume(_noDataTimer);
}

-(void)startSkipButtonTimer
{
    if(_noDataTimer) dispatch_source_cancel(_noDataTimer);
    
    NSTimeInterval period = 1.0;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _skipButtonTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_skipButtonTimer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(_skipButtonTimer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_skipButton xh_stateWithskipType:_skipType andDuration:_duration];
            if(_duration==0)
            {
                dispatch_source_cancel(_skipButtonTimer);
                
                [self remove];
            }
            _duration--;
        });
    });
    dispatch_resume(_skipButtonTimer);
}
-(void)skipAction{
    
    if(_skipType != SkipTypeTime)
    {
        self.isClick = NO;
        if (_skipButtonTimer) dispatch_source_cancel(_skipButtonTimer);
        [self remove];
    }
}

-(void)tapAction:(UITapGestureRecognizer *)tap
{
    if(_duration>0)
    {
        self.isClick = YES;
        if(_clickBlock) _clickBlock();
    }
}

-(UIImage *)getLaunchImage
{
    UIImage *imageP = [self launchImageWithType:@"Portrait"];
    if(imageP) return imageP;
    UIImage *imageL = [self launchImageWithType:@"Landscape"];
    if(imageL) return imageL;
    NSLog(@"获取LaunchImage失败!请检查是否添加启动图,或者规格是否有误.");
    return nil;
}
-(UIImage *)launchImageWithType:(NSString *)type
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = type;
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if([viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            if([dict[@"UILaunchImageOrientation"] isEqualToString:@"Landscape"])
            {
                imageSize = CGSizeMake(imageSize.height, imageSize.width);
            }
            if(CGSizeEqualToSize(imageSize, viewSize))
            {
                launchImageName = dict[@"UILaunchImageName"];
                UIImage *image = [UIImage imageNamed:launchImageName];
                return image;
            }
        }
    }
    return nil;
}
-(void)setAdFrame:(CGRect)adFrame
{
    _adFrame = adFrame;
    _adImgView.frame = adFrame;
}
-(void)setNoDataDuration:(NSInteger)noDataDuration
{
    if(noDataDuration<1) noDataDuration=1;
    _noDataDuration = noDataDuration;
    dispatch_source_cancel(_noDataTimer);
    [self startNoDataDispath_tiemr];
}
-(void)remove{

    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:0.3 options: UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState=[UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        _isShowFinish = YES;
        if(_showFinishBlock)  _showFinishBlock();
        [UIView setAnimationsEnabled:oldState];
    }completion:NULL];

}
@end
