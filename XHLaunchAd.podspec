Pod::Spec.new do |s|
  s.name         = "XHLaunchAd"
  s.version      = "3.0.0"
  s.summary      = "开屏广告解决方案,支持图片/视频、静态/动态、全屏/半屏广告,支持iPhone/iPad,自带图片下载、缓存功能,无其他三方依赖"
  s.homepage     = "https://github.com/CoderZhuXH/XHLaunchAd"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHLaunchAd.git", :tag => s.version }
  s.source_files = "XHLaunchAd", "*.{h,m}"
  s.requires_arc = true
end
