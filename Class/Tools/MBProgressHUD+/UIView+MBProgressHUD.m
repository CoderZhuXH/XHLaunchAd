//
//  UIView+MBProgressHUD.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/13.
//  Copyright © 2016年 it7090.com. All rights reserved.
//

#import "UIView+MBProgressHUD.h"
#import "MBProgressHUD.h"

@implementation UIView (MBProgressHUD)

-(void)showHUD
{
    [MBProgressHUD showIn:self];
}
-(void)showHUDAndText:(NSString *)text
{
    [MBProgressHUD showIn:self text:text];
}
-(void)hideHUD
{
    [MBProgressHUD hideAllIn:self];
}

#pragma mark-Private
+ (MBProgressHUD *)showIn:(UIView *)view
{
    return [MBProgressHUD showIn:view enabled:NO];//可触控
}
+(MBProgressHUD *)showIn:(UIView *)view text:(NSString *)text
{
    MBProgressHUD *hud = [MBProgressHUD showIn:view];
    hud.labelText =text;
    return hud;
}
+ (MBProgressHUD *)showIn:(UIView *)view enabled:(BOOL)enabled
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = enabled;
    return hud;
}
+(BOOL)hideAllIn:(UIView *)view
{
    return [MBProgressHUD hideAllHUDsForView:view animated:YES];
}
@end
