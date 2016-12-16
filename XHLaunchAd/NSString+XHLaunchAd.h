//
//  NSString+XHLaunchAd.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 2016/6/26.
//  Copyright © 2016年 it7090.com. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import <Foundation/Foundation.h>

@interface NSString (XHLaunchAd)

@property(nonatomic,assign,readonly)BOOL xh_isURLString;

@property(nonatomic,copy,readonly,nonnull)NSString *xh_videoName;

@property(nonatomic,copy,readonly,nonnull)NSString *xh_md5String;

-(BOOL)xh_containsSubString:(nonnull NSString *)subString;

@end
