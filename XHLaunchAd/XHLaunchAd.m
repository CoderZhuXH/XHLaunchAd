//
//  XHLaunchAd.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAd.h"
#import "XHImageCache.h"

static NSInteger const defaultDuration = 5;//默认停留时间

@interface XHLaunchAd()

@property(nonatomic,strong)UIImageView *launchImgView;
@property(nonatomic,strong)UIImageView *adImgView;
@property(nonatomic,strong)UIButton *skipButton;
@property(nonatomic,assign)NSInteger duration;
@property(nonatomic,copy)dispatch_source_t timer;
@property(nonatomic,copy)showFinishBlock showFinishBlock;
@property(nonatomic,copy)clickBlock clickBlock;
@property(nonatomic,assign)BOOL hideSkip;

@end
@implementation XHLaunchAd

+(void)showWithAdFrame:(CGRect)frame hideSkip:(BOOL)hide setAdImage:(setAdImageBlock)setAdImage click:(clickBlock)click showFinish:(showFinishBlock)showFinish
{
    XHLaunchAd *AdVC = [[XHLaunchAd alloc] initWithFrame:frame click:(clickBlock)click showFinish:showFinish];
    AdVC.hideSkip = hide;
    [[UIApplication sharedApplication].delegate window].rootViewController = AdVC;
    if(setAdImage) setAdImage(AdVC);
}
- (instancetype)initWithFrame:(CGRect)frame click:(clickBlock)click showFinish:(void(^)())showFinish
{
    self = [super init];
    if (self) {
        
        _adFrame = frame;
        _duration = defaultDuration;
        _showFinishBlock = [showFinish copy];
        _clickBlock = [click copy];
        [self.view addSubview:self.launchImgView];
    }
    return self;
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
        _launchImgView.image = [self launchImage];
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
-(UIButton *)skipButton
{
    if(_skipButton == nil)
    {
        _skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _skipButton.hidden = _hideSkip;
        _skipButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-70,30, 60, 30);
        _skipButton.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        _skipButton.layer.cornerRadius = 15;
        _skipButton.layer.masksToBounds = YES;
        NSInteger duration = _duration;
        [_skipButton setTitle:[NSString stringWithFormat:@"%ld 跳过",duration] forState:UIControlStateNormal];
        _skipButton.titleLabel.font = [UIFont systemFontOfSize:13.5];
        [_skipButton addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
        [self dispath_tiemr];
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
-(void)dispath_tiemr
{
    NSTimeInterval period = 1.0;//每秒执行
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    
    __block NSInteger duration =_duration;
    dispatch_source_set_event_handler(_timer, ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [_skipButton setTitle:[NSString stringWithFormat:@"%ld 跳过",duration] forState:UIControlStateNormal];
            if(duration==0)
            {
                [self remove];
                dispatch_source_cancel(_timer);
            }
            duration--;

        });
    });
    dispatch_resume(_timer);
}
-(void)remove{
    
    [UIView transitionWithView:[[UIApplication sharedApplication].delegate window] duration:0.5 options: UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState=[UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        if(_showFinishBlock)  _showFinishBlock();
        [UIView setAnimationsEnabled:oldState];
    }completion:NULL];
    
}
-(void)skipAction{
    
    [self remove];
}
-(void)tapAction:(UITapGestureRecognizer *)tap
{
    if(_clickBlock) _clickBlock();
}
-(UIImage *)launchImage
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = @"Portrait";//横屏 @"Landscape"
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
            UIImage *image = [UIImage imageNamed:launchImageName];
            return image;
        }
    }
    NSLog(@"请添加启动图片");
    return nil;
}
-(void)setAdFrame:(CGRect)adFrame
{
    _adFrame = adFrame;
    _adImgView.frame = adFrame;
}

-(void)imgUrlString:(NSString *)imgUrlString duration:(NSInteger)duration options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock
{
    if(duration) _duration = duration;
    [self setupAdImgViewAndSkipButton];
    [_adImgView xh_setImageWithURL:[NSURL URLWithString:imgUrlString] placeholderImage:nil options:options completed:completedBlock];
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
@end
