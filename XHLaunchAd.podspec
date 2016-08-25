Pod::Spec.new do |s|
  s.name         = "XHLaunchAd"
  s.version      = "2.1.3"
  s.summary      = "几行代码接入启动页广告, 自带图片下载、缓存相关功能,无任何第三方依赖,支持静态/动态、全屏/半屏广告"
  s.homepage     = "https://github.com/CoderZhuXH/XHLaunchAd"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHLaunchAd.git", :tag => s.version }
  s.source_files = "XHLaunchAd", "*.{h,m}"
  s.requires_arc = true
end
