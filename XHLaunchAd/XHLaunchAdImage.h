//
//  XHLaunchAdImage.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2017/5/2.
//  Copyright © 2017年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <UIKit/UIKit.h>

@interface XHLaunchAdImage : UIImage

@property (nonatomic, readonly) NSTimeInterval *frameDurations;

@property (nonatomic, readonly) NSTimeInterval totalDuration;

@property (nonatomic, readonly) NSUInteger loopCount;

- (UIImage*)getFrameWithIndex:(NSUInteger)idx;

@end
