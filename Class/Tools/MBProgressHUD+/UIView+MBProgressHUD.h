//
//  UIView+MBProgressHUD.h
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/13.
//  Copyright © 2016年 it7090.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (MBProgressHUD)

/**
 *  showHUD
 */
-(void)showHUD;

/**
 *  showHUD+Text
 */
-(void)showHUDAndText:(NSString *)text;

/**
 *  移除HUD
 */
-(void)hideHUD;

@end
