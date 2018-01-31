![](Logo/header.png)

### 开屏广告、启动广告解决方案-支持静态/动态图片广告/mp4视频广告

[![AppVeyor](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg?maxAge=2592000)](https://github.com/CoderZhuXH/XHLaunchAd)
[![Version Status](https://img.shields.io/cocoapods/v/XHLaunchAd.svg?style=flat)](http://cocoadocs.org/docsets/XHLaunchAd)
[![Support](https://img.shields.io/badge/support-iOS8%2B-brightgreen.svg)](https://github.com/CoderZhuXH/XHLaunchAd)
[![Pod Platform](https://img.shields.io/cocoapods/p/XHLaunchAd.svg?style=flat)](http://cocoadocs.org/docsets/XHLaunchAd/)
[![Pod License](https://img.shields.io/cocoapods/l/XHLaunchAd.svg?style=flat)](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/LICENSE)

### 特性:

* 1.支持静态/动态图片广告.
* 2.支持mp4视频广告.
* 3.支持全屏/半屏广告.
* 4.支持网络及本地资源.
* 5.兼容iPhone和iPad.
* 6.支持广告点击事件.
* 7.支持自定义跳过按钮,添加子视图.
* 8.支持设置数据等待时间.
* 9.自带图片/视频下载,缓存功能.
* 10.支持预缓存图片及视频.
* 11.支持设置完成动画.
* 12.支持清除指定资源缓存.
* 13.支持LaunchImage 和 LaunchScreen.storyboard.
* 14.等等等...

### 技术交流群(群号:537476189)

### 更新记录:  

*   2018.01.31 -- v3.9.6 -->1.添加视频广告静音属性(muted),2.显示视频广告时暂停其它APP音频播放显示完恢复,3.增加视频播放失败通知
*   2018.01.11 -- v3.9.5 -->1.修复videoGravity修饰符错误bug...
*   2017.12.29 -- v3.9.4 -->1.替换视频播放控制器为AVPlayerViewController 2.解决/优化在线程阻塞的情况下视频播放加载慢的问题 3.注意:此次更新后XHLaunchAd支持iOS8及以上版本,不在支持iOS7...
*   2017.11.22 -- v3.9.0 -->1.新增部分代理方法,部分旧的代理方法做过期处理,2.几处优化...
*   2017.11.14 -- v3.8.4 -->1.版本优化,2.bug fix...
*   2017.10.18 -- v3.8.0 -->1.增加对LaunchScreen.storyboard支持,2.修复pod导入编译报错问题...
*   2017.10.11 -- v3.7.1 -->1.批量缓存接口增加结果回调...
*   2017.10.09 -- v3.7.0 -->1.增加几种清除缓存的接口,2.增加几种倒计时按钮类型,3.已知问题优化与修复...
*   2017.09.29 -- v3.6.1 -->1.增加清除指定图片/视频缓存接口,2.优化在iPhoneX上显示效果,3.已知问题优化与修复...
*   2017.09.18 -- v3.6.0 -->1.优化图片解码方案,2.支持设置GIF动图是否循环播放...
*   2017.09.13 -- v3.5.8 -->增加几种显示完成的动画...
*   2017.08.20 -- v3.5.6 -->已知问题修复及内存优化...
*   2017.05.26 -- v3.5.4 -->修复横屏启动造成的界面问题...
*   2017.05.02 -- v3.5.0 -->Gif动图占用内存优化...
*   2017.04.26 -- v3.4.6 -->版本优化,bug fix...
*   2017.02.17 -- v3.4.0 -->修复部分出现Crash Bug...
*	2016.12.14 -- v3.2.0 -->添加subViews属性2.添加缓存检测...
*	2016.12.03 -- v3.0.0 -->1.增加mp4视频开屏广告2.增加对本地资源支持3.增加预缓存接口4.增加更多属性及接口,具有更强的自定义性5.可设置显示完成动画类型6.可自定义跳过按钮7.拥有更优雅的接入接口8.优化缓存机制,bug fix等等...
*	2016.11.05 -- v2.2.0 -->增加一种缓存方案:先缓存,下次显示.<br>
*	2016.09.13 -- v2.1.8 -->修复在Swift中使用异常.<br>
*	2016.09.10 -- v2.1.7 -->适配iPad,增加应用内跳转到广告详情,优化.<br>
*	2016.09.07 -- v2.1.5 -->修复跳过按钮类型设为None无效问题.<br>
*	2016.09.01 -- v2.1.4 -->广告url传nil或不合法时,按无数据处理.<br>
*	2016.08.22 -- v2.1.2 -->增加未检测到广告数据,设置启动页停留时间属性.<br>
*	2016.08.19 -- v2.1.1 -->跳过按钮bug修复.<br>
*	2016.08.18 -- v2.1.0 -->API微调,增加设置跳过按钮类型选项.<br>
*	2016.08.16 -- v2.0 -->1.修复显示广告前RootViewController闪现bug; 2.API重构,增强实用性.<br>
*	2016.07.18 -- v1.2 -->增加对GIF动态广告的支持.<br>
*	2016.07.02 -- v1.1.2 -->增加设置缓存机制选项.<br>
*	2016.06.17 -- v1.1 -->增加倒计时/跳过按钮.<br>
*	2016.06.13 -- v1.0

## 效果

### 静态/动态广告-图片/视频广告

![](/ScreenShot/ScreenShot00.gif) ![](/ScreenShot/ScreenShot01.gif) ![](/ScreenShot/ScreenShot02.gif)
![](/ScreenShot/ScreenShot04.gif) ![](/ScreenShot/ScreenShot05.gif)  ![](/ScreenShot/ScreenShot06.gif)

## 使用方法

### 1.在didFinishLaunchingWithOptions中或UIApplicationDidFinishLaunching时初始化开屏广告

### -1.1 添加图片开屏广告-使用本地数据
#### -1.1.1 使用默认配置快速初始化
```objc
//1.使用默认配置初始化

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

    //配置广告数据
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"image0.jpg";
     //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
    imageAdconfiguration.openModel = @"http://www.it7090.com";
    //显示图片开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
```
#### -1.1.2自定义配置初始化

```objc
//2.自定义配置初始化

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

    //配置广告数据
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
    //广告停留时间
    imageAdconfiguration.duration = 5;
    //广告frame
    imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-150);
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"image0.jpg";
    //设置GIF动图是否只循环播放一次(仅对动图设置有效)
    imageAdconfiguration.GIFImageCycleOnce = NO;
    //网络图片缓存机制(只对网络图片有效)
    imageAdconfiguration.imageOption = XHLaunchAdImageRefreshCached;
    //图片填充模式
    imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
     //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
    imageAdconfiguration.openModel = @"http://www.it7090.com";
    //广告显示完成动画
    imageAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
    //广告显示完成动画时间
    imageAdconfiguration.showFinishAnimateTime = 0.8;
    //跳过按钮类型
    imageAdconfiguration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    imageAdconfiguration.showEnterForeground = NO;
    
     //设置要添加的子视图(可选)
    //imageAdconfiguration.subViews = ...

    //显示图片开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self]; 
    
```
### -1.2 添加图片开屏广告-使用网络数据
#### -1.2.1 使用默认配置快速初始化

```objc

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

	//1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
    //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将不显示
    //3.数据获取成功,配置广告数据后,自动结束等待,显示广告
    //注意:请求广告数据前,必须设置此属性,否则会先进入window的的根控制器
    [XHLaunchAd setWaitDataDuration:3];
    
    //广告数据请求
    [Network getLaunchAdImageDataSuccess:^(NSDictionary * response) {
        
        NSLog(@"广告数据 = %@",response);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
        //配置广告数据
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
        //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
        imageAdconfiguration.imageNameOrURLString = model.content;
         //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
        imageAdconfiguration.openModel = model.openUrl;
        //显示开屏广告
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
        
    } failure:^(NSError *error) {
    }];


```
#### -1.2.2 自定义配置初始化

```objc

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

 	//1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
    //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将不显示
    //3.数据获取成功,配置广告数据后,自动结束等待,显示广告
    //注意:请求广告数据前,必须设置此属性,否则会先进入window的的根控制器
    [XHLaunchAd setWaitDataDuration:3];
    
    //广告数据请求
    [Network getLaunchAdImageDataSuccess:^(NSDictionary * response) {
        
        NSLog(@"广告数据 = %@",response);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
        //配置广告数据
        XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
        //广告停留时间
        imageAdconfiguration.duration = model.duration;
        //广告frame
        imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/model.width*model.height);
        //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
        imageAdconfiguration.imageNameOrURLString = model.content;
        //设置GIF动图是否只循环播放一次(仅对动图设置有效)
        imageAdconfiguration.GIFImageCycleOnce = NO;
        //缓存机制(仅对网络图片有效)
        //为告展示效果更好,可设置为XHLaunchAdImageCacheInBackground,先缓存,下次显示
        imageAdconfiguration.imageOption = XHLaunchAdImageDefault;
        //图片填充模式
        imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
         //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
        imageAdconfiguration.openModel = model.openUrl;
        //广告显示完成动画
        imageAdconfiguration.showFinishAnimate =ShowFinishAnimateLite;
        //广告显示完成动画时间
        imageAdconfiguration.showFinishAnimateTime = 0.8;
        //跳过按钮类型
        imageAdconfiguration.skipButtonType = SkipTypeTimeText;
        //后台返回时,是否显示广告
        imageAdconfiguration.showEnterForeground = NO;

         //设置要添加的自定义视图(可选)
         //imageAdconfiguration.subViews = ...
 
        //显示开屏广告
        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
        
    } failure:^(NSError *error) {
    }];

```

### -1.3添加视频开屏广告-使用本地数据
#### -1.3.1 使用默认配置快速初始化

```objc

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

    //1.使用默认配置初始化
    XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration defaultConfiguration];
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguration.videoNameOrURLString = @"video0.mp4";
     //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
    videoAdconfiguration.openModel = @"http://www.it7090.com";
    //显示视频开屏广告
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
```

#### -1.3.2 自定义配置初始化

```objc   

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

	//2.自定义配置
    XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration new];
    //广告停留时间
    videoAdconfiguration.duration = 5;
    //广告frame
    videoAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguration.videoNameOrURLString = @"video1.mp4";
    //是否关闭音频
    videoAdconfiguration.muted = NO;
    //视频填充模式
    videoAdconfiguration.videoGravity = AVLayerVideoGravityResizeAspectFill;
    //是否只循环播放一次
    videoAdconfiguration.videoCycleOnce = NO;
     //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
    videoAdconfiguration.openModel =  @"http://www.it7090.com";
    //广告显示完成动画
    videoAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
    //广告显示完成动画时间
    videoAdconfiguration.showFinishAnimateTime = 0.8;
    //跳过按钮类型
    videoAdconfiguration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    videoAdconfiguration.showEnterForeground = NO;
    
    //设置要添加的子视图(可选)
    //videoAdconfiguration.subViews = ...
    
    //显示视频开屏广告
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
    
```
### -1.4添加视频开屏广告-使用网络数据
#### -1.4.1 使用默认配置快速初始化

```objc

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

    //1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
    //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将不显示
    //3.数据获取成功,配置广告数据后,自动结束等待,显示广告
    //注意:请求广告数据前,必须设置此属性,否则会先进入window的的根控制器
    [XHLaunchAd setWaitDataDuration:3];
    
    //广告数据请求
    [Network getLaunchAdVideoDataSuccess:^(NSDictionary * response) {
        
        NSLog(@"广告数据 = %@",response);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
        
        //配置广告数据
        XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration defaultConfiguration];
        //注意:视频广告只支持先缓存,下次显示(看效果请二次运行)
        videoAdconfiguration.videoNameOrURLString = model.content;
         //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
        videoAdconfiguration.openModel = model.openUrl;
        [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
        
    } failure:^(NSError *error) {
    }];


```
#### -1.4.2 自定义配置初始化

```objc

    //设置你工程的启动页使用的是:LaunchImage 还是 LaunchScreen.storyboard(不设置默认:LaunchImage)
    [XHLaunchAd setLaunchSourceType:SourceTypeLaunchImage];

 	//1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
    //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将不显示
    //3.数据获取成功,配置广告数据后,自动结束等待,显示广告
    //注意:请求广告数据前,必须设置此属性,否则会先进入window的的根控制器
    [XHLaunchAd setWaitDataDuration:3];
    
    //广告数据请求
    [Network getLaunchAdVideoDataSuccess:^(NSDictionary * response) {
        
        NSLog(@"广告数据 = %@",response);
        
        //广告数据转模型
        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
        
        //配置广告数据
        XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration new];
        //广告停留时间
        videoAdconfiguration.duration = model.duration;
        //广告frame
        videoAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width/model.width*model.height);
        //广告视频URLString/或本地视频名(请带上后缀)
        //注意:视频广告只支持先缓存,下次显示(看效果请二次运行)
        videoAdconfiguration.videoNameOrURLString = model.content;
        //是否关闭音频
        videoAdconfiguration.muted = NO;
        //视频填充模式
        videoAdconfiguration.videoGravity = AVLayerVideoGravityResizeAspectFill;
        //是否只循环播放一次
        videoAdconfiguration.videoCycleOnce = NO;
         //广告点击打开页面参数(openModel可为NSString,模型,字典等任意类型)
        videoAdconfiguration.openModel = model.openUrl;
        //广告显示完成动画
        videoAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
        //广告显示完成动画时间
        videoAdconfiguration.showFinishAnimateTime = 0.8;
        //后台返回时,是否显示广告
        videoAdconfiguration.showEnterForeground = NO;
        //跳过按钮类型
        videoAdconfiguration.skipButtonType = SkipTypeTimeText;

        //设置要添加的自定义视图(可选)
        //videoAdconfiguration.subViews = ...

        [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
        
    } failure:^(NSError *error) {
    }];


```

#### -1.5.0 显示完成动画支持以下效果

```objc

/** 显示完成动画类型 */
typedef NS_ENUM(NSInteger , ShowFinishAnimate) {
    /** 无动画 */
    ShowFinishAnimateNone = 1,
    /** 普通淡入(default) */
    ShowFinishAnimateFadein = 2,
    /** 放大淡入 */
    ShowFinishAnimateLite = 3,
    /** 左右翻转(类似网易云音乐) */
    ShowFinishAnimateFlipFromLeft = 4,
    /** 下上翻转 */
    ShowFinishAnimateFlipFromBottom = 5,
    /** 向上翻页 */
    ShowFinishAnimateCurlUp = 6,
};

```

#### -1.6.0 跳过按钮支持以下类型

```objc

/** 跳过按钮类型 */
typedef NS_ENUM(NSInteger,SkipType) {
    SkipTypeNone      = 1,//无
    /** 方形 */
    SkipTypeTime      = 2,//方形:倒计时
    SkipTypeText      = 3,//方形:跳过
    SkipTypeTimeText  = 4,//方形:倒计时+跳过 (default)
    /** 圆形 */
    SkipTypeRoundTime = 5,//圆形:倒计时
    SkipTypeRoundText = 6,//圆形:跳过
    SkipTypeRoundProgressTime = 7,//圆形:进度圈+倒计时
    SkipTypeRoundProgressText = 8,//圆形:进度圈+跳过
};

```


### 2.点击事件
```objc
/**
广告点击事件代理方法
*/
-(void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenModel:(id)openModel clickPoint:(CGPoint)clickPoint{

    NSLog(@"广告点击事件");

    /** openModel即配置广告数据设置的点击广告时打开页面参数(configuration.openModel) */
     
    if(openModel==nil) return;

    NSString *urlString = (NSString *)openModel;

    //此处跳转页面
    //WebViewController *VC = [[WebViewController alloc] init];
    //VC.URLString = urlString;
    ////此处不要直接取keyWindow
    //UIViewController* rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    //[rootVC.myNavigationController pushViewController:VC animated:YES];

}

```
### 3.自定义跳过按钮
```objc
//1.XHLaunchImageAdConfiguration 和XHLaunchVideoAdConfiguration 均有一个configuration.customSkipView 属性
//2.自定义一个skipView 赋值给configuration.customSkipView属性 便可替换默认跳过按钮 如下:
configuration.customSkipView = [self customSkipView];

-(UIView *)customSkipView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor =[UIColor orangeColor];
    button.layer.cornerRadius = 5.0;
    button.layer.borderWidth = 1.5;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    CGFloat y = XH_IPHONEX ? 54 : 30;
    button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-100,y, 85, 30);
    [button addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)skipAction
{
     //移除广告
    [XHLaunchAd removeAndAnimated:YES];
}

/**
 *  代理方法 - 倒计时回调
 *
 *  @param launchAd XHLaunchAd
 *  @param duration 倒计时时间
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd customSkipView:(UIView *)customSkipView duration:(NSInteger)duration
{
    UIButton *button = (UIButton *)customSkipView;//此处转换为你之前的类型
    //设置自定义跳过按钮倒计时
    [button setTitle:[NSString stringWithFormat:@"自定义%lds",duration] forState:UIControlStateNormal];
}
```

### 4.批量下载缓存接口(如果你需要提前批量下载并缓存广告图片或视频请调用下面方法)
```objc

/**
 *  批量下载并缓存image(异步) - 已缓存的image不会再次下载缓存
 *
 *  @param urlArray image URL Array
 */
+(void)downLoadImageAndCacheWithURLArray:(NSArray <NSURL *> * )urlArray;

/**
 批量下载并缓存image,并回调结果(异步)- 已缓存的image不会再次下载缓存

 @param urlArray image URL Array
 @param completedBlock 回调结果为一个字典数组,url:图片的url字符串,result:0表示该图片下载缓存失败,1表示该图片下载并缓存完成或本地缓存中已有该图片
 */
+(void)downLoadImageAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray completed:(nullable XHLaunchAdBatchDownLoadAndCacheCompletedBlock)completedBlock;

/**
 *  批量下载并缓存视频(异步) - 已缓存的视频不会再次下载缓存
 *
 *  @param urlArray 视频URL Array
 */
+(void)downLoadVideoAndCacheWithURLArray:(NSArray <NSURL *> * )urlArray;

/**
 批量下载并缓存视频,并回调结果(异步) - 已缓存的视频不会再次下载缓存
 
 @param urlArray 视频URL Array
 @param completedBlock 回调结果为一个字典数组,url:视频的url字符串,result:0表示该视频下载缓存失败,1表示该视频下载并缓存完成或本地缓存中已有该视频
 */
+(void)downLoadVideoAndCacheWithURLArray:(nonnull NSArray <NSURL *> * )urlArray completed:(nullable XHLaunchAdBatchDownLoadAndCacheCompletedBlock)completedBlock;

```

### 5.检测是否已缓存

```objc

/**
 *  是否已缓存在该图片
 *
 *  @param url image url
 *
 *  @return BOOL
 */
+(BOOL)checkImageInCacheWithURL:(NSURL *)url;

/**
 *  是否已缓存该视频
 *
 *  @param url video url
 *
 *  @return BOOL
 */
+(BOOL)checkVideoInCacheWithURL:(NSURL *)url;

```

### 6.缓存/清理相关
```objc

/**
 *  清除XHLaunch本地所有缓存
 */
+(void)clearDiskCache;

/**
 清除指定Url的图片本地缓存(异步)

 @param imageUrlArray 需要清除缓存的图片Url数组
 */
+(void)clearDiskCacheWithImageUrlArray:(NSArray<NSURL *> *)imageUrlArray;

/**
 清除指定Url除外的图片本地缓存(异步)
 
 @param exceptImageUrlArray 此url数组的图片缓存将被保留,不会被清理
 */
+(void)clearDiskCacheExceptImageUrlArray:(NSArray<NSURL *> *)exceptImageUrlArray;

/**
 清除指定Url的视频本地缓存(异步)

 @param videoUrlArray 需要清除缓存的视频url数组
 */
+(void)clearDiskCacheWithVideoUrlArray:(NSArray<NSURL *> *)videoUrlArray;

/**
 清除指定Url除外的视频本地缓存(异步)
 
 @param exceptVideoUrlArray 此url数组的视频缓存将被保留,不会被清理
 */
+(void)clearDiskCacheExceptVideoUrlArray:(NSArray<NSURL *> *)exceptVideoUrlArray;


/**
 *  获取XHLaunch本地缓存大小(M)
 */
+(float)diskCacheSize;

/**
 *  缓存路径
 */
+(NSString *)xhLaunchAdCachePath;

```

### 7.其它代理方法
```objc
/**
 *  图片本地读取/或下载完成回调
 *
 *  @param launchAd  XHLaunchAd
 *  @param image 读取/下载的image
 *  @param imageData 读取/下载的imageData
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd imageDownLoadFinish:(UIImage *)image imageData:(NSData *)imageData;
{
    NSLog(@"图片下载完成/或本地图片读取完成回调");
}
/**
 *  视频下载完成回调
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
-(void)xhLaunchAdShowFinish:(XHLaunchAd *)launchAd
{
    NSLog(@"广告显示完成");
}

/**
 如果你想用SDWebImage等框架加载网络广告图片,请实现此代理(注意:实现此方法后,图片缓存将不受XHLaunchAd管理)
 
 @param launchAd          XHLaunchAd
 @param launchAdImageView launchAdImageView
 @param url               图片url
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd launchAdImageView:(UIImageView *)launchAdImageView URL:(NSURL *)url
{
    [launchAdImageView sd_setImageWithURL:url];

}

```

##  常见问题
####    1.为什么设置了本地图片广告,却提示找不到图片资源?
*   请将本地广告图片,直接放在工程目录,不要放在Assets里面,XHLaunchAd不是通过imageName:读取图片,而是是通过[NSBundle mainBundle] path....的方式读取本地图片的(此处涉及到内存优化)

####    2.为什么我启动的时候会先进入根控制器后,再显示广告页面?
*   请确认下,你在请求广告数据之前,是否有调用`[XHLaunchAd setWaitDataDuration:3];`方法设置数据等待时间

####    3.为什么有时候我会卡在启动广告页面不动(偶现)?
*   此情况多出现在网络环境差时,请检查你程序启动时,有没有掉用同步方法或同步请求,(例如:环信SDK同步登录等),
*   XHLaunchAd采用GCD定时器,不受主线程阻塞影响,但更新UI是在主线程中进行的.


##  依赖
####    1.本库依赖于:FLAnimatedImage

##  安装
### 1.手动添加:<br>
*   1.将 XHLaunchAd 文件夹添加到工程目录中<br>
*   2.导入 XHLaunchAd.h

### 2.CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHLaunchAd'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 XHLaunchAd.h

###	3.Tips
*   1.如果发现pod search XHLaunchAd 搜索出来的不是最新版本，需要在终端执行cd ~/desktop退回到desktop，然后执行pod setup命令更新本地spec缓存（需要几分钟），然后再搜索就可以了
*   2.如果你发现你执行pod install后,导入的不是最新版本,请删除Podfile.lock文件,在执行一次 pod install
*   3.如果在使用过程中遇到BUG，希望你能Issues我，谢谢（或者尝试下载最新的代码看看BUG修复没有）

##  系统要求
*   该项目最低支持 iOS 8.0 和 Xcode 8.0

##  许可证
XHLaunchAd 使用 MIT 许可证，详情见 LICENSE 文件
