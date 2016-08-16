//
//  AppDelegate.m
//  XHLaunchAdExample
//
//  Created by xiaohui on 16/6/13.
//  Copyright © 2016年 qiantou. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "AppDelegate.h"
#import "ViewController.h"
#import "XHLaunchAd.h"

//静态广告
#define ImgUrlString1 @"http://img.taopic.com/uploads/allimg/120906/219077-120Z616330677.jpg"
//动态广告
#define ImgUrlString2 @"http://i1.17173cdn.com/9ih5jd/YWxqaGBf/forum/images/2015/05/09/213417be9ziz2ancctivad.gif"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    /**
     *  场景1:广告图片url地址已知
     */
    [self example1];
    
    
    /**
     *  场景2.广告图片url地址未知,向服务器请求:
     */
    
    //[self example2];

    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark-场景1:广告url地址已知
-(void)example1
{
    [XHLaunchAd showWithAdFrame:CGRectMake(0, 0,self.window.bounds.size.width, self.window.bounds.size.height-150) hideSkip:NO setAdImage:^(XHLaunchAd *launchAd) {
        
        [launchAd imgUrlString:ImgUrlString2 duration:5 options:XHWebImageRefreshCached completed:^(UIImage *image, NSURL *url) {
            
            //异步加载图片完成回调(若需根据图片尺寸,刷新广告frame,可在这里操作)
            //launchAd.adFrame = ...;
            
        }];

    } click:^{
        
        //广告点击事件
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.returnoc.com"]];
        
    } showFinish:^{
        
        //广告展示完成回调:
        
        //设置window 根控制器
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
        
    }];
}

#pragma mark-场景2.广告url地址未知,向服务器请求
-(void)example2
{

    [XHLaunchAd showWithAdFrame:CGRectMake(0, 0,self.window.bounds.size.width, self.window.bounds.size.height-150) hideSkip:NO setAdImage:^(XHLaunchAd *launchAd) {
        
        //模拟获取广告url数据请求
        [self requestImageUrl:^(NSString *imgUrl,NSInteger duration) {
        
            [launchAd imgUrlString:imgUrl duration:duration options:XHWebImageRefreshCached completed:^(UIImage *image, NSURL *url) {
                        
                //异步加载图片完成回调(若需根据图片尺寸,刷新广告frame,可在这里操作)
                //launchAd.adFrame = ...;
                        
            }];
                
        }];
        
    } click:^{
        
        //广告点击事件:
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.returnoc.com"]];
        
    } showFinish:^{
        
        //广告展示完成回调:
        
        //设置window 根控制器
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
        
    }];
}

/**
 *  模拟:向服务器请求广告Url地址、停留时间
 *
 *  @param imgUrl 回调url地址,及停留时间
 */
-(void)requestImageUrl:(void(^)(NSString *imgUrl,NSInteger duration))imgUrl{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if(imgUrl)
        {
            imgUrl(ImgUrlString1,5);
        }
    });
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
