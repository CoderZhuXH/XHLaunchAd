//
//  AppDelegate.m
//  XHLaunchAdExample
//
//  Created by zhuxiaohui on 16/6/13.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//  代码地址:https://github.com/CoderZhuXH/XHLaunchAd

#import "AppDelegate.h"
#import "ViewController.h"
#import "XHLaunchAd.h"
#import "Network.h"
#import "LaunchAdModel.h"
#import "WebViewController.h"

//静态图
#define imageURL1 @"http://c.hiphotos.baidu.com/image/pic/item/4d086e061d950a7b78c4e5d703d162d9f2d3c934.jpg"
#define imageURL2 @"http://d.hiphotos.baidu.com/image/pic/item/f7246b600c3387444834846f580fd9f9d72aa034.jpg"
#define imageURL3 @"http://d.hiphotos.baidu.com/image/pic/item/64380cd7912397dd624a32175082b2b7d0a287f6.jpg"
#define imageURL4 @"http://d.hiphotos.baidu.com/image/pic/item/14ce36d3d539b60071473204e150352ac75cb7f3.jpg"

//动态图
#define imageURL5 @"http://c.hiphotos.baidu.com/image/pic/item/d62a6059252dd42a6a943c180b3b5bb5c8eab8e7.jpg"
#define imageURL6 @"http://p1.bqimg.com/567571/4ce1a4c844b09201.gif"
#define imageURL7 @"http://p1.bqimg.com/567571/23a4bc7a285c1179.gif"

//视频链接
#define videoURL1 @"http://ohnzw6ag6.bkt.clouddn.com/video0.mp4"
#define videoURL2  @"http://120.25.226.186:32812/resources/videos/minion_01.mp4";
#define videoURL3 @"http://ohnzw6ag6.bkt.clouddn.com/video1.mp4"
#define videoURL4 @"https://github.com/CoderZhuXH/XHLaunchAdExample/blob/master/Source/video0.mp4?raw=true"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    /**
     *  1.图片开屏广告 - 网络数据
     */
    
    //[self example01_imageAd_networkData];
    
    /**
     *  2.图片开屏广告 - 本地数据
     */
    
    [self example02_imageAd_localData];
    
    /**
     *  3.视频开屏广告 - 网络数据(首次不显示,视频缓存ok后,下次显示)
     */
    
    //[self example03_videoAd_networkData];
    
    /**
     *  4.视频开屏广告 - 本地数据
     */
    
    //[self example04_videoAd_localData];
    

    /**
     *  5.如需自定义跳过按钮,请看这个示例
     */
    
    //[self example05_customSkipButton];
    
    
    /**
     *  6.使用默认配置快速初始化,请看下面两个示例
     */
    //[self example06_imageAd_defaultConfiguratuon];
    //[self example07_videoAd_defaultConfiguratuon];
    
    /**
     * 7.如果你想提前缓存图片/视频请调下面这两个接口
     */
    //+(void)downLoadImageAndCacheWithURLArray:(NSArray <NSURL *> * )urlArray;
    //+(void)downLoadVideoAndCacheWithURLArray:(NSArray <NSURL *> * )urlArray;
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - 图片开屏广告-网络数据-示例
//图片开屏广告 - 网络数据
-(void)example01_imageAd_networkData
{
    //设为3即表示,启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将自动进入window的RootVC
    [XHLaunchAd setWaitDataDuration:3];//请求广告数据前,必须设置
    
    //广告数据请求
    [Network getLaunchAdImageDataSuccess:^(NSDictionary * response) {
        
        NSLog(@"广告数据 = %@",response);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
        //配置广告数据
        XHLaunchImageAdConfiguratuon *imageAdconfiguratuon = [XHLaunchImageAdConfiguratuon new];
        //广告停留时间
        imageAdconfiguratuon.duration = model.duration;
        //广告frame
        imageAdconfiguratuon.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/model.width*model.height);
        //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
        imageAdconfiguratuon.imageNameOrURLString = model.content;
        //缓存机制
        imageAdconfiguratuon.imageOption = XHLaunchAdImageDefault;
        //图片填充模式
        imageAdconfiguratuon.contentMode = UIViewContentModeScaleToFill;
        //广告点击打开链接
        imageAdconfiguratuon.openURLString = model.openUrl;
        //广告显示完成动画
        imageAdconfiguratuon.showFinishAnimate =ShowFinishAnimateFadein;
        //跳过按钮类型
        imageAdconfiguratuon.skipButtonType = SkipTypeTimeText;
        //后台返回时,是否显示广告
        imageAdconfiguratuon.showEnterForeground = NO;
        //显示开屏广告
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguratuon delegate:self];
        
    } failure:^(NSError *error) {
    }];
    
}
#pragma mark - 图片开屏广告-本地数据-示例
//图片开屏广告 - 本地数据
-(void)example02_imageAd_localData
{
    //配置广告数据
    XHLaunchImageAdConfiguratuon *imageAdconfiguratuon = [XHLaunchImageAdConfiguratuon new];
    //广告停留时间
    imageAdconfiguratuon.duration = 5;
    //广告frame
    imageAdconfiguratuon.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/1242*1786);
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguratuon.imageNameOrURLString = @"image2.jpg";
    //缓存机制
    imageAdconfiguratuon.imageOption = XHLaunchAdImageRefreshCached;
    //图片填充模式
    imageAdconfiguratuon.contentMode = UIViewContentModeScaleToFill;
    //广告点击打开链接
    imageAdconfiguratuon.openURLString = @"http://www.returnoc.com";
    //广告显示完成动画
    imageAdconfiguratuon.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    imageAdconfiguratuon.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    imageAdconfiguratuon.showEnterForeground = NO;
    //显示开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguratuon delegate:self];
    
}

#pragma mark - 视频开屏广告-网络数据-示例
//视频开屏广告 - 网络数据
-(void)example03_videoAd_networkData
{
    //设为3即表示,启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将自动进入window的RootVC
    [XHLaunchAd setWaitDataDuration:3];//请求广告数据前,必须设置
    
    //广告数据请求
    [Network getLaunchAdVideoDataSuccess:^(NSDictionary * response) {
        
         NSLog(@"广告数据 = %@",response);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
        
        //配置广告数据
        XHLaunchVideoAdConfiguratuon *videoAdconfiguratuon = [XHLaunchVideoAdConfiguratuon new];
        //广告停留时间
        videoAdconfiguratuon.duration = model.duration;
        //广告frame
        videoAdconfiguratuon.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/model.width*model.height);
        //广告视频URLString/或本地视频名(请带上后缀)
        //注意:视频广告只支持先缓存,下次显示
        videoAdconfiguratuon.videoNameOrURLString = model.content;
        //视频缩放模式
        videoAdconfiguratuon.scalingMode = MPMovieScalingModeAspectFill;
        //广告点击打开链接
        videoAdconfiguratuon.openURLString = model.openUrl;
        //广告显示完成动画
        videoAdconfiguratuon.showFinishAnimate =ShowFinishAnimateFadein;
        //后台返回时,是否显示广告
        videoAdconfiguratuon.showEnterForeground = NO;
        //跳过按钮类型
        videoAdconfiguratuon.skipButtonType = SkipTypeTimeText;
        
        [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguratuon delegate:self];
        
    } failure:^(NSError *error) {
    }];
    
}
#pragma mark - 视频开屏广告-本地数据-示例
//视频开屏广告 - 本地数据
-(void)example04_videoAd_localData
{
    //配置广告数据
    XHLaunchVideoAdConfiguratuon *videoAdconfiguratuon = [XHLaunchVideoAdConfiguratuon new];
    //广告停留时间
    videoAdconfiguratuon.duration = 5;
    //广告frame
    videoAdconfiguratuon.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguratuon.videoNameOrURLString = @"video1.mp4";
    //视频填充模式
    videoAdconfiguratuon.scalingMode = MPMovieScalingModeAspectFill;
    //广告点击打开链接
    videoAdconfiguratuon.openURLString =  @"http://www.returnoc.com";
    //跳过按钮类型
    videoAdconfiguratuon.skipButtonType = SkipTypeTimeText;
    //广告显示完成动画
    videoAdconfiguratuon.showFinishAnimate =ShowFinishAnimateFadein;
    //后台返回时,是否显示广告
    videoAdconfiguratuon.showEnterForeground = NO;
    //显示开屏广告
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguratuon delegate:self];
    
}
#pragma mark - 自定义跳过按钮-示例
-(void)example05_customSkipButton
{
    //注意:
    //1.自定义跳过按钮很简单,configuratuon有一个customSkipView属性.
    //2.自定义一个跳过的view 赋值给configuratuon.customSkipView属性便可替换默认跳过按钮,如下:
    
    //配置广告数据
    XHLaunchImageAdConfiguratuon *imageAdconfiguratuon = [XHLaunchImageAdConfiguratuon new];
    //广告停留时间
    imageAdconfiguratuon.duration = 5;
    //广告frame
    imageAdconfiguratuon.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/1242*1786);
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguratuon.imageNameOrURLString = @"image11.gif";
    //缓存机制
    imageAdconfiguratuon.imageOption = XHLaunchAdImageRefreshCached;
    //图片填充模式
    imageAdconfiguratuon.contentMode = UIViewContentModeScaleToFill;
    //广告点击打开链接
    imageAdconfiguratuon.openURLString = @"http://www.returnoc.com";
    //广告显示完成动画
    imageAdconfiguratuon.showFinishAnimate =ShowFinishAnimateFadein;
    //后台返回时,是否显示广告
    imageAdconfiguratuon.showEnterForeground = NO;
    
    
    //start********************自定义跳过按钮**************************
    imageAdconfiguratuon.customSkipView = [self customSkipView];
    //********************自定义跳过按钮*****************************end
    
    
    //显示开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguratuon delegate:self];


}
#pragma mark - 使用默认配置快速初始化 - 示例
-(void)example06_imageAd_defaultConfiguratuon
{
    //使用默认配置
    XHLaunchImageAdConfiguratuon *imageAdconfiguratuon = [XHLaunchImageAdConfiguratuon defaultConfiguratuon];
    //广告视频URLString/或本地视频名(请带上后缀)
    imageAdconfiguratuon.imageNameOrURLString = @"image0.jpg";
    ////广告点击打开链接
    imageAdconfiguratuon.openURLString = @"http://www.returnoc.com";
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguratuon delegate:self];
}

-(void)example07_videoAd_defaultConfiguratuon
{
    //使用默认配置
    XHLaunchVideoAdConfiguratuon *videoAdconfiguratuon = [XHLaunchVideoAdConfiguratuon defaultConfiguratuon];
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguratuon.videoNameOrURLString = @"video0.mp4";
    ////广告点击打开链接
    videoAdconfiguratuon.openURLString = @"http://www.returnoc.com";
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguratuon delegate:self];
}
#pragma mark - customSkipView
//自定义跳过按钮
-(UIView *)customSkipView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor =[UIColor orangeColor];
    button.layer.cornerRadius = 5.0;
    button.layer.borderWidth = 1.5;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-100,30, 85, 40);
    [button addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
//跳过按钮点击事件
-(void)skipAction
{
    [XHLaunchAd skipAction];
}
#pragma mark - XHLaunchAd delegate - 倒计时回调
/**
 *  倒计时回调
 *
 *  @param launchAd XHLaunchAd
 *  @param duration 倒计时时间
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd customSkipView:(UIView *)customSkipView duration:(NSInteger)duration
{
    //设置自定义跳过按钮时间
    UIButton *button = (UIButton *)customSkipView;//此处转换为你之前的类型
    //设置时间
    [button setTitle:[NSString stringWithFormat:@"自定义%lds",duration] forState:UIControlStateNormal];
}
#pragma mark - XHLaunchAd delegate - 其他

/**
 *  广告点击事件 回调
 */
- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenURLString:(NSString *)openURLString;
{
    NSLog(@"广告点击");
    if(openURLString)
    {
        WebViewController *VC = [[WebViewController alloc] init];
        VC.URLString = openURLString;
        [self.window.rootViewController presentViewController:VC animated:YES completion:nil];
        
    }
}
/**
 *  图片本地读取/或下载完成回调
 *
 *  @param launchAd XHLaunchAd
 *  @param image    image
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd imageDownLoadFinish:(UIImage *)image
{
    NSLog(@"图片下载完成/或本地图片读取完成回调");
}
/**
 *  视频本地读取/或下载完成回调
 *
 *  @param launchAd XHLaunchAd
 *  @param pathURL  视频保存在本地的path
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd videoDownLoadFinish:(NSURL *)pathURL
{
    NSLog(@"video下载/加载完成/保存path = %@",pathURL.absoluteString);
}

/**
 *  视频下载进度回调
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd videoDownLoadProgress:(float)progress total:(unsigned long long)total current:(unsigned long long)current
{
    NSLog(@"总大小=%lld,已下载大小=%lld,下载进度=%f",total,current,progress);
    
}
/**
 *  广告显示完成
 */
-(void)xhLaunchShowFinish:(XHLaunchAd *)launchAd
{
    NSLog(@"广告显示完成");
}
/**
 如果你想用SDWebImage等框架加载网络广告图片,请实现此代理
 
 @param launchAd          XHLaunchAd
 @param launchAdImageView launchAdImageView
 @param url               图片url
 */
//-(void)xhLaunchAd:(XHLaunchAd *)launchAd launchAdImageView:(UIImageView *)launchAdImageView URL:(NSURL *)url
//{
//    [launchAdImageView sd_setImageWithURL:url];
//
//}

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
