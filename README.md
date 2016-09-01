![](Logo/header.png)

* 几行代码接入启动页广告.
* 1.支持全屏/半屏广告.
* 2.支持静态/动态广告.
* 3.支持广告点击事件
* 4.自带图片下载,缓存功能.
* 5.支持设置未检测到广告数据,启动页停留时间
* 6.无依赖其他第三方框架.
* 7.支持启动页为LaunchImage或者LaunchScreen.storyboard

###技术交流群(群号:537476189).

### 更新记录:

*    2016.09.01 -- v2.1.4   -->广告url传nil或不合法时,按无数据处理<br>
*    2016.08.25 -- v2.1.3   -->增加半屏广告对LaunchScreen.storyboard的支持<br>
*    2016.08.22 -- v2.1.2   -->增加未检测到广告数据,设置启动页停留时间属性<br>
*    2016.08.19 -- v2.1.1   -->跳过按钮bug修复<br>
*    2016.08.18 -- v2.1.0   -->API微调,增加设置跳过按钮类型选项<br>
*    2016.08.16 -- v2.0   -->1.修复显示广告前RootViewController闪现bug; 2.API重构,增强实用性<br>
*    2016.07.18 -- v1.2   -->增加对GIF动态广告的支持<br>
*    2016.07.07 -- v1.1.4 -->优化<br>
*    2016.07.02 -- v1.1.2 -->增加设置缓存机制选项<br>
*    2016.06.17 -- v1.1   -->增加倒计时/跳过按钮<br>
*    2016.06.13 -- v1.0

## 效果
###静态广告/动态广告
![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot01.gif) ![image](https://github.com/CoderZhuXH/XHLaunchAd/blob/master/ScreenShot02.gif)
##API
*    一共提供两个API
*    1.初始化方法
```objc
/**
 *  显示启动广告
 *
 *  @param frame      广告frame
 *  @param setAdImage 设置AdImage回调
 *  @param showFinish 广告显示完成回调
 */
+(void)showWithAdFrame:(CGRect)frame setAdImage:(setAdImageBlock)setAdImage showFinish:(showFinishBlock)showFinish;
```
*    2.数据源方法
```objc
/**
 *  设置广告数据
 *
 *  @param imageUrl       图片url
 *  @param duration       广告停留时间
 *  @param skipType       跳过按钮类型
 *  @param options        图片缓存机制
 *  @param completedBlock 异步加载完图片回调
 *  @param click          广告点击事件回调
 */
-(void)setImageUrl:(NSString*)imageUrl duration:(NSInteger)duration skipType:(SkipType)skipType options:(XHWebImageOptions)options completed:(XHWebImageCompletionBlock)completedBlock click:(clickBlock)click;
```
## 使用方法
#### 在AppDelegate中导入XHLaunchAd.h 头文件,在didFinishLaunchingWithOptions:方法中调用下面方法
```objc
    
    //1.显示启动广告
    [XHLaunchAd showWithAdFrame:CGRectMake(0, 0,self.window.bounds.size.width, self.window.bounds.size.height-150) setAdImage:^(XHLaunchAd *launchAd) {
            
            //未检测到广告数据,启动页停留时间,默认3,(设置4即表示:启动页显示了4s,还未检测到广告数据,就自动进入window根控制器)
            //launchAd.noDataDuration = 4;

            //广告图片地址
            NSString *imgUrl = @"http://c.hiphotos.baidu.com/image/pic/item/d62a6059252dd42a6a943c180b3b5bb5c8eab8e7.jpg";
            //广告停留时间
            NSInteger duration = 6;
            //广告点击跳转链接
            NSString *openUrl = @"http://www.returnoc.com";

            //2.设置广告数据
            [launchAd setImageUrl:imgUrl duration:duration skipType:SkipTypeTimeText options:XHWebImageDefault completed:^(UIImage *image, NSURL *url) {
                
                //异步加载图片完成回调,若需根据图片尺寸,刷新广告frame,可在这里操作
                //launchAd.adFrame = ...;
                
            } click:^{
                
                //广告点击事件
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:openUrl]];
                
            }];
            
    } showFinish:^{
        
        //广告展示完成回调,设置window根控制器
        self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[UIViewController alloc] init]];
        
    }];

```
#### 3.其他操作
```objc

/**
 *  设置未检测到广告数据,启动页停留时间(默认3s)(最小1s)
 */
@property (nonatomic, assign) NSInteger noDataDuration;

/**
 *  重置广告frame
 */
@property (nonatomic, assign) CGRect adFrame;

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
### 1.手动添加:<br>
*   1.将 XHLaunchAd 文件夹添加到工程目录中<br>
*   2.导入 XHLaunchAd.h

### 2.CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHLaunchAd'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 XHLaunchAd.h

### 3.Tips
*   1.如果发现pod search XHLaunchAd 搜索出来的不是最新版本，需要在终端执行cd ~/desktop退回到desktop，然后执行pod setup命令更新本地spec缓存（需要几分钟），然后再搜索就可以了
*   2.如果你发现你执行pod install后,导入的不是最新版本,请删除Podfile.lock文件,在执行一次 pod install

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
XHLaunchAd 使用 MIT 许可证，详情见 LICENSE 文件