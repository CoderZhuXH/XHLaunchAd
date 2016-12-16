//
//  XHLaunchAdSkipButton.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/9.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>

/**
 *  倒计时类型
 */
typedef NS_ENUM(NSInteger,SkipType) {
    
    SkipTypeNone      = 1,//无
    SkipTypeTime      = 2,//倒计时
    SkipTypeText      = 3,//跳过
    SkipTypeTimeText  = 4,//倒计时+跳过
    
};

@interface XHLaunchAdButton : UIButton

@property(nonatomic,strong)UILabel *timeLab;
@property(nonatomic,assign)CGFloat leftRightSpace;
@property(nonatomic,assign)CGFloat topBottomSpace;

/**
 *  设置skipButton 状态
 */
-(void)stateWithskipType:(SkipType)skipType andDuration:(NSInteger)duration;

@end
