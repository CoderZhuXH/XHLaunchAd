![](Logo/header.png)

###开屏广告解决方案---支持静态/动态图片广告/mp4视频广告

[![AppVeyor](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg?maxAge=2592000)](https://github.com/CoderZhuXH/XHLaunchAd)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/CoderZhuXH/XHLaunchAd)
[![Version Status](https://img.shields.io/cocoapods/v/XHLaunchAd.svg?style=flat)](http://cocoadocs.org/docsets/XHLaunchAd)
[![Support](https://img.shields.io/badge/support-iOS%207%2B-brightgreen.svg)](https://github.com/CoderZhuXH/XHLaunchAd)
[![Pod Platform](https://img.shields.io/cocoapods/p/XHLaunchAd.svg?style=flat)](http://cocoadocs.org/docsets/XHLaunchAd/)
[![Pod License](https://img.shields.io/cocoapods/l/XHLaunchAd.svg?style=flat)](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/LICENSE)

==============

###特性:

* 1.支持静态/动态图片广告.
* 2.支持mp4视频广告.
* 3.支持全屏/半屏广告.
* 4.支持网络及本地资源.
* 5.兼容iPhone和iPad.
* 6.支持广告点击事件.
* 7.支持自定义跳过按钮.
* 8.支持设置数据等待时间.
* 9.自带图片/视频下载,缓存功能.
* 10.支持预缓存图片及视频.
* 11.支持设置完成动画.
* 12.无依赖其他第三方库等等...

###技术交流群(群号:537476189).

### 更新记录:
*	2016.12.14 -- v3.2.0 -->1.添加subViews属性2.添加缓存检测...
*	2016.12.03 -- v3.0.0 -->1.增加mp4视频开屏广告2.增加对本地资源支持3.增加预缓存接口4.增加更多属性及接口,具有更强的自定义性5.可设置显示完成动画类型6.可自定义跳过按钮7.拥有更优雅的接入接口8.优化缓存机制,bug fix等等...
*	2016.11.05 -- v2.2.0  -->增加一种缓存方案:先缓存,下次显示.<br>
*	2016.09.13 -- v2.1.8  -->修复在Swift中使用异常.<br>
*	2016.09.10 -- v2.1.7  -->适配iPad,增加应用内跳转到广告详情,优化.<br>
*	2016.09.07 -- v2.1.5   -->修复跳过按钮类型设为None无效问题.<br>
*	2016.09.01 -- v2.1.4   -->广告url传nil或不合法时,按无数据处理.<br>
*	2016.08.22 -- v2.1.2   -->增加未检测到广告数据,设置启动页停留时间属性.<br>
*	2016.08.19 -- v2.1.1   -->跳过按钮bug修复.<br>
*	2016.08.18 -- v2.1.0   -->API微调,增加设置跳过按钮类型选项.<br>
*	2016.08.16 -- v2.0   -->1.修复显示广告前RootViewController闪现bug; 2.API重构,增强实用性.<br>
*	2016.07.18 -- v1.2   -->增加对GIF动态广告的支持.<br>
*	2016.07.07 -- v1.1.4 -->优化.<br>
*	2016.07.02 -- v1.1.2 -->增加设置缓存机制选项.<br>
*	2016.06.17 -- v1.1   -->增加倒计时/跳过按钮.<br>
*	2016.06.13 -- v1.0

## 效果
###静态/动态广告-图片/视频广告
![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot/ScreenShot00.gif) ![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot/ScreenShot01.gif) ![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot/ScreenShot02.gif)
![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot/ScreenShot04.gif) ![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot/ScreenShot05.gif)  ![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot/ScreenShot06.gif)

## 使用方法

### 1.设置App启动页为LaunchImage,设置方法可百度、谷歌 ,或[戳这里>>>](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/LaunchImageSet/LaunchImageSet.md)
### 2.在AppDelegate中导入XHLaunchAd.h 头文件,在didFinishLaunchingWithOptions:方法中添加下面代码

###-2.1 添加图片开屏广告
####-- 2.1.1 使用默认配置快速初始化
```objc
//1.使用默认配置初始化
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration defaultConfiguration];
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"image0.jpg";
    //广告点击打开链接
    imageAdconfiguration.openURLString = @"http://www.returnoc.com";
    //显示图片开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
```
####-- 2.1.2自定义配置初始化
```objc
//2.自定义配置初始化
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
    //广告停留时间
    imageAdconfiguration.duration = 5;
    //广告frame
    imageAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-150);
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"image0.jpg";
    //网络图片缓存机制(只对网络图片有效)
    imageAdconfiguration.imageOption = XHLaunchAdImageRefreshCached;
    //图片填充模式
    imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
    //广告点击打开链接
    imageAdconfiguration.openURLString = @"http://www.returnoc.com";
    //广告显示完成动画
    imageAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    imageAdconfiguration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    imageAdconfiguration.showEnterForeground = NO;
    
     //设置要添加的子视图(可选)
    //imageAdconfiguration.subViews = ...

    //显示图片开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self]; 
    
```
###-2.2添加视频开屏广告
####--2.2.1 使用默认配置快速初始化
```objc

//1.使用默认配置初始化
    XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration defaultConfiguration];
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguration.videoNameOrURLString = @"video0.mp4";
    //广告点击打开链接
    videoAdconfiguration.openURLString = @"http://www.returnoc.com";
    //显示视频开屏广告
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
```

####--2.2.2 自定义配置初始化
```objc   
//2.自定义配置
    XHLaunchVideoAdConfiguration *videoAdconfiguration = [XHLaunchVideoAdConfiguration new];
    //广告停留时间
    videoAdconfiguration.duration = 5;
    //广告frame
    videoAdconfiguration.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    //广告视频URLString/或本地视频名(请带上后缀)
    videoAdconfiguration.videoNameOrURLString = @"video1.mp4";
    //URL
    //videoAdconfiguration.videoNameOrURLString = videoURL;
    //视频填充模式
    videoAdconfiguration.scalingMode = MPMovieScalingModeAspectFill;
    //广告点击打开链接
    videoAdconfiguration.openURLString =  @"http://www.returnoc.com";
    //广告显示完成动画
    videoAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
     //跳过按钮类型
    videoAdconfiguration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    videoAdconfiguration.showEnterForeground = NO;
    
    //设置要添加的子视图(可选)
    //videoAdconfiguration.subViews = ...
    
    //显示视频开屏广告
    [XHLaunchAd videoAdWithVideoAdConfiguration:videoAdconfiguration delegate:self];
    
```
###注意:
>若你的广告图片/视频URL来源于数据请求,请在请求数据前设置等待时间,在数据请求成功回调里配置广告,如下:

```objc

//1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
//2.设为3即表示,启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将自动进入window的RootVC

	 //设置数据等待时间
    [XHLaunchAd setWaitDataDuration:3];
    
    //广告数据请求
    [Network getLaunchAdImageDataSuccess:^(NSDictionary * response) {
        
      //在此处利用服务器返回的广告数据,按上面示例添加开屏广告代码
      XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration ... 

     //配置相关参数.... 

     //显示开屏广告
     [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
              
    } failure:^(NSError *error) {
    }];   
    
   
```
### 3.点击事件
```objc
/**
 *  广告点击事件 回调
 */
- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenURLString:(NSString *)openURLString;
{
    if(openURLString)
    {
    	 //跳转到广告详情页面
        WebViewController *VC = [[WebViewController alloc] init];
        VC.URLString = openURLString;
        [self.window.rootViewController presentViewController:VC animated:YES completion:nil];
        
    }
}

```
### 4.自定义跳过按钮
```objc
//1.XHLaunchImageAdConfiguration 和XHLaunchVideoAdConfiguration 均有一个configuration.customSkipView 属性
//2.自定义一个skipView 赋值给configuration.customSkipView属性 便可替换默认跳过按钮 如下:
configuration.customSkipView = [self customSkipView];

-(UIView *)customSkipView
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor =[ UIColor clearColor];
    button.layer.cornerRadius = 3.0;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.frame = CGRectMake(15,[UIScreen mainScreen].bounds.size.height-55, 85, 40);
    [button addTarget:self action:@selector(skipAction) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

-(void)skipAction
{
    [XHLaunchAd skipAction];
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
### 5.预缓存接口(如果你需要提前下载并缓存广告图片或视频 请调用下面方法)
```objc
/**
 *  批量下载并缓存image(异步)
 *
 *  @param urlArray image URL Array
 */
+(void)downLoadImageAndCacheWithURLArray:(NSArray <NSURL *> * )urlArray;

/**
 *  批量下载并缓存视频(异步)
 *
 *  @param urlArray 视频URL Array
 */
+(void)downLoadVideoAndCacheWithURLArray:(NSArray <NSURL *> * )urlArray;
```

### 6.检测是否已缓存

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

### 7.其他代理方法
```objc
/**
 *  图片下载完成/或本地图片读取完成 回调
 *
 *  @param launchAd XHLaunchAd
 *  @param image    image
 */
-(void)xhLaunchAd:(XHLaunchAd *)launchAd imageDownLoadFinish:(UIImage *)image
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
-(void)xhLaunchAd:(XHLaunchAd *)launchAd launchAdImageView:(UIImageView *)launchAdImageView URL:(NSURL *)url
{
    [launchAdImageView sd_setImageWithURL:url];

}

```

### 8.其他操作
```objc

/**
 *  清除XHLaunch本地缓存
 */
+(void)clearDiskCache;

/**
 *  获取XHLaunch本地缓存大小(M)
 */
+(float)diskCacheSize;

/**
 *  缓存路径
 */
+(NSString *)xhLaunchAdCachePath;

```
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
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
XHLaunchAd 使用 MIT 许可证，详情见 LICENSE 文件
