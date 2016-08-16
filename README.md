# XHLaunchAd
* 1.几行代码实现启动页广告功能.
* 2.支持静态/动态广告
* 3.无依赖其他第三方框架.

###技术交流群(群号:537476189).

### ....版本记录....持续更新....
##### -2016.08.16  Version 2.0(更新)
*   1.修复显示广告前会闪下RootViewController的bug<br>
*   2.架构重构,API重构,增强实用性
*   3.抛弃1.2版本前接口,启用新接口,使用性更强,调用更方便.

##### -2016.07.18  Version 1.2(更新)
*   1.增加对GIF动态广告的支持<br>

##### -2016.07.04/07  Version 1.1.3/1.1.4(更新)
*   1.优化<br>

##### -2016.07.02  Version 1.1.2(更新)
*   1.初始化修改(初始化后自动添加到视图)<br>
*   2.设置广告图片URLString时,增加设置缓存机制选项<br>

##### -2016.06.17  Version 1.1(更新)
*   1.增加倒计时/跳过按钮<br>
*   2.优化图片缓存机制<br>

##### -2016.06.13  Version 1.0(发布)

## 效果
###静态广告/动态广告
![image](http://d3.freep.cn/3tb_160718185058pj0i569478.gif)![image](http://d2.freep.cn/3tb_160816162120wxou569478.gif)![image](http://d3.freep.cn/3tb_1607181850570c8q569478.gif)

## 使用方法
#### 1.设置项目启动页为LaunchImage
*    1.设置方法:在Assets.xcassets中新建LaunchImage<br>
     2.在项目`TARGETS->General->App Icons and Launch Images`中设置 `Launch Images Source` 为LaunchImage,并将`Launch Screen File` 设为空(如图)<br>
     ![image](http://g.hiphotos.baidu.com/image/pic/item/5bafa40f4bfbfbed65801e4370f0f736afc31f34.jpg)

#### 2.在LaunchImage 添加相应启动图片<br>
*    1.如图<br>
     ![image](http://g.hiphotos.baidu.com/image/pic/item/14ce36d3d539b6000c0f278be150352ac75cb7cc.jpg)

#### 3.在AppDelegate中导入XHLaunchAd.h 头文件,在didFinishLaunchingWithOptions:方法中调用下面方法
```objc

    [XHLaunchAd showWithAdFrame:CGRectMake(0, 0,self.window.bounds.size.width, self.window.bounds.size.height-150) hideSkip:NO setAdImage:^(XHLaunchAd *launchAd) {
        
        [launchAd imgUrlString:ImgUrlString duration:5 options:XHWebImageRefreshCached completed:^(UIImage *image, NSURL *url) {
            
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