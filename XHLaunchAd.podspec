Pod::Spec.new do |s|
  s.name         = "XHLaunchAd"
  s.version      = "2.0.1"
  s.summary      = "几行代码实现启动页广告功能"
  s.homepage     = "https://github.com/CoderZhuXH/XHLaunchAd"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { "Zhu Xiaohui" => "977950862@qq.com"}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/CoderZhuXH/XHLaunchAd.git", :tag => s.version }
  s.source_files = "XHLaunchAd", "*.{h,m}"
  s.requires_arc = true
end
