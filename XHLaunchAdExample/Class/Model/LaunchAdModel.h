//
//  LaunchAdModel.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/28.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd
//  广告数据模型

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LaunchAdModel : NSObject

/**
 *  广告URL
 */
@property (nonatomic, copy) NSString *content;

/**
 *  点击打开连接
 */
@property (nonatomic, copy) NSString *openUrl;

/**
 *  广告分辨率
 */
@property (nonatomic, copy) NSString *contentSize;

/**
 *  广告停留时间
 */
@property (nonatomic, assign) NSInteger duration;


/**
 *  分辨率宽
 */
@property(nonatomic,assign,readonly)CGFloat width;
/**
 *  分辨率高
 */
@property(nonatomic,assign,readonly)CGFloat height;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
