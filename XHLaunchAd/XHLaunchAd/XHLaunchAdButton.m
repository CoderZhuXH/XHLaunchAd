//
//  XHLaunchAdSkipButton.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/9.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "XHLaunchAdButton.h"
#import "XHLaunchAdConst.h"

/** Progress颜色 */
#define RoundProgressColor  [UIColor whiteColor]
/** 背景色 */
#define BackgroundColor [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]
/** 字体颜色 */
#define FontColor  [UIColor whiteColor]

#define SkipTitle @"跳过"
/** 倒计时单位 */
#define DurationUnit @"S"

@interface XHLaunchAdButton()
@property(nonatomic,assign)SkipType skipType;
@property(nonatomic,assign)CGFloat leftRightSpace;
@property(nonatomic,assign)CGFloat topBottomSpace;
@property(nonatomic,strong)UILabel *timeLab;
@property (nonatomic,strong) CAShapeLayer *roundLayer;
@property(nonatomic,copy)dispatch_source_t roundTimer;
@end

@implementation XHLaunchAdButton

- (instancetype)initWithSkipType:(SkipType)skipType{
    self = [super init];
    if (self) {
        
        _skipType = skipType;
        CGFloat y = XH_IPHONEX ? 44 : 20;
        //环形
        if(skipType == SkipTypeRoundTime || skipType ==SkipTypeRoundText || skipType == SkipTypeRoundProgressTime || skipType == SkipTypeRoundProgressText){
            self.frame = CGRectMake(XH_ScreenW-55,y, 42, 42);
        }else{//方形
             self.frame = CGRectMake(XH_ScreenW-80,y, 70, 35);
        }
        switch (skipType) {
            case SkipTypeNone:{
                self.hidden = YES;
            }
                break;
            case SkipTypeTime:{
                [self addSubview:self.timeLab];
                self.leftRightSpace = 5;
                self.topBottomSpace = 2.5;
            }
                break;
            case SkipTypeText:{
                [self addSubview:self.timeLab];
                self.leftRightSpace = 5;
                self.topBottomSpace = 2.5;
            }
                break;
            case SkipTypeTimeText:{
                [self addSubview:self.timeLab];
                self.leftRightSpace = 5;
                self.topBottomSpace = 2.5;
            }
                break;
            case SkipTypeRoundTime:{
                [self addSubview:self.timeLab];
            }
                break;
            case SkipTypeRoundText:{
                [self addSubview:self.timeLab];
            }
                break;
            case SkipTypeRoundProgressTime:{
                [self addSubview:self.timeLab];
                [self.timeLab.layer addSublayer:self.roundLayer];
            }
                break;
            case SkipTypeRoundProgressText:{
                [self addSubview:self.timeLab];
                [self.timeLab.layer addSublayer:self.roundLayer];
            }
                break;
            default:
                break;
        }
    }
    return self;
}

-(UILabel *)timeLab{
    if(_timeLab ==  nil){
        _timeLab = [[UILabel alloc] initWithFrame:self.bounds];
        _timeLab.textColor = FontColor;
        _timeLab.backgroundColor = BackgroundColor;
        _timeLab.layer.masksToBounds = YES;
        _timeLab.textAlignment = NSTextAlignmentCenter;
        _timeLab.font = [UIFont systemFontOfSize:13.5];
        [self cornerRadiusWithView:_timeLab];
    }
    return _timeLab;
}

-(CAShapeLayer *)roundLayer{
    if(_roundLayer==nil){
        _roundLayer = [CAShapeLayer layer];
        _roundLayer.fillColor = BackgroundColor.CGColor;
        _roundLayer.strokeColor = RoundProgressColor.CGColor;
        _roundLayer.lineCap = kCALineCapRound;
        _roundLayer.lineJoin = kCALineJoinRound;
        _roundLayer.lineWidth = 2;
        _roundLayer.frame = self.bounds;
        _roundLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.timeLab.bounds.size.width/2.0, self.timeLab.bounds.size.width/2.0) radius:self.timeLab.bounds.size.width/2.0-1.0 startAngle:-0.5*M_PI endAngle:1.5*M_PI clockwise:YES].CGPath;
        _roundLayer.strokeStart = 0;
    }
    return _roundLayer;
}

- (void)setTitleWithSkipType:(SkipType)skipType duration:(NSInteger)duration{
    
    switch (skipType) {
        case SkipTypeNone:{
            self.hidden = YES;
        }
            break;
        case SkipTypeTime:{
            self.hidden = NO;
            self.timeLab.text = [NSString stringWithFormat:@"%ld %@",duration,DurationUnit];
        }
            break;
        case SkipTypeText:{
            self.hidden = NO;
            self.timeLab.text = SkipTitle;
        }
            break;
        case SkipTypeTimeText:{
            self.hidden = NO;
            self.timeLab.text = [NSString stringWithFormat:@"%ld %@",duration,SkipTitle];
        }
            break;
        case SkipTypeRoundTime:{
            self.hidden = NO;
            self.timeLab.text = [NSString stringWithFormat:@"%ld %@",duration,DurationUnit];
        }
            break;
        case SkipTypeRoundText:{
            self.hidden = NO;
            self.timeLab.text = SkipTitle;
        }
            break;
        case SkipTypeRoundProgressTime:{
            self.hidden = NO;
            self.timeLab.text = [NSString stringWithFormat:@"%ld %@",duration,DurationUnit];
        }
            break;
        case SkipTypeRoundProgressText:{
            self.hidden = NO;
            self.timeLab.text = SkipTitle;
        }
            break;
        default:
            break;
    }
}

-(void)startRoundDispathTimerWithDuration:(CGFloat )duration{
    NSTimeInterval period = 0.05;
    __block CGFloat roundDuration = duration;
    _roundTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
    dispatch_source_set_timer(_roundTimer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_roundTimer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if(roundDuration<=0){
                self.roundLayer.strokeStart = 1;
                DISPATCH_SOURCE_CANCEL_SAFE(_roundTimer);
            }
            self.roundLayer.strokeStart += 1/(duration/period);
            roundDuration -= period;
        });
    });
    dispatch_resume(_roundTimer);
}

-(void)setLeftRightSpace:(CGFloat)leftRightSpace{
    _leftRightSpace = leftRightSpace;
    CGRect frame = self.timeLab.frame;
    CGFloat width = frame.size.width;
    if(leftRightSpace<=0 || leftRightSpace*2>= width) return;
    frame = CGRectMake(leftRightSpace, frame.origin.y, width-2*leftRightSpace, frame.size.height);
    self.timeLab.frame = frame;
    [self cornerRadiusWithView:self.timeLab];
}

-(void)setTopBottomSpace:(CGFloat)topBottomSpace{
    _topBottomSpace = topBottomSpace;
    CGRect frame = self.timeLab.frame;
    CGFloat height = frame.size.height;
    if(topBottomSpace<=0 || topBottomSpace*2>= height) return;
    frame = CGRectMake(frame.origin.x, topBottomSpace, frame.size.width, height-2*topBottomSpace);
    self.timeLab.frame = frame;
   [self cornerRadiusWithView:self.timeLab];
}

-(void)cornerRadiusWithView:(UIView *)view{
    CGFloat min = view.frame.size.height;
    if(view.frame.size.height > view.frame.size.width) {
        min = view.frame.size.width;
    }
    view.layer.cornerRadius = min/2.0;
    view.layer.masksToBounds = YES;
}

@end
