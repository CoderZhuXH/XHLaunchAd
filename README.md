# XHLaunchAd
* 1.几行代码实现启动页广告功能.
* 2.无依赖其他第三方框架.不阻塞主控制器加载.

###技术交流群(群号:537476189).

### ....版本记录....持续更新....

##### -下版计划
*    增加对动态广告支持<br>

##### -2016.07.07  Version 1.1.4(更新)
*   1.优化<br>

##### -2016.07.04  Version 1.1.3(更新)
*   1.优化<br>

##### -2016.07.02  Version 1.1.2(更新)
*   1.初始化修改(初始化后自动添加到视图)<br>
*   2.设置广告图片URLString时,增加设置缓存机制选项<br>

##### -2016.06.17  Version 1.1(更新)
*   1.增加倒计时/跳过按钮<br>
*   2.优化图片缓存机制<br>

##### -2016.06.13  Version 1.0(发布)

## 效果
![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/DEMO.gif?raw=true)
## 使用方法
#### 1.设置项目启动页为LaunchImage
*    1.设置方法:在Assets.xcassets中新建LaunchImage<br>
     2.在项目`TARGETS->General->App Icons and Launch Images`中设置 `Launch Images Source` 为LaunchImage,并将`Launch Screen File` 设为空(如图)<br>
     ![image](http://g.hiphotos.baidu.com/image/pic/item/5bafa40f4bfbfbed65801e4370f0f736afc31f34.jpg)

#### 2.在LaunchImage 添加相应启动图片<br>
*    1.如图<br>
     ![image](http://g.hiphotos.baidu.com/image/pic/item/14ce36d3d539b6000c0f278be150352ac75cb7cc.jpg)

#### 3.在AppDelegate中导入XHLaunchAd.h 头文件,在didFinishLaunchingWithOptions:方法中调用下面代码
```objc
    //1.初始化启动页广告(初始化后,自动添加至视图,不用手动添加)
    XHLaunchAd *launchAd = [[XHLaunchAd alloc] initWithFrame:CGRectMake(0, 0,self.window.bounds.size.width,  self.window.bounds.size.height-150) andDuration:5];
    
    //2.设置启动页广告图片的url(必须)
    NSString *imgUrlString =@"http://img.taopic.com/uploads/allimg/120906/219077-120Z616330677.jpg";
    
    [launchAd imgUrlString:imgUrlString options:XHWebImageRefreshCached completed:^(UIImage *image, NSURL *url) {
        //异步加载图片完成回调(若需根据图片实际尺寸,刷新广告frame,可在这里操作)
        //launchAd.adFrame = ...;
    }];
    
    //是否影藏'倒计时/跳过'按钮[默认显示](可选)
    launchAd.hideSkip = NO;
    
    //广告点击事件(可选)
    launchAd.clickBlock = ^()
    {
        NSString *url = @"https://www.baidu.com";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    };
```
#### 4.其他操作
```objc
/**
 *  清除图片本地缓存
 */
+(void)clearDiskCache;

/**
 *  获取缓存图片占用总大小(M)
 */
+ (float)imagesCacheSize;
```
##  安装
### 手动添加:<br>
*   1.将 XHLaunchAd 文件夹添加到工程目录中<br>
*   2.导入 XHLaunchAd.h

### CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHLaunchAd'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 XHLaunchAd.h

### Tips
*   如果你发现你执行pod install后,导入的不是最新版本,请删除Podfile.lock文件,在执行一次 pod install

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
XHLaunchAd 使用 MIT 许可证，详情见 LICENSE 文件