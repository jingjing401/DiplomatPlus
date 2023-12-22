Pod::Spec.new do |s|
  s.name         = "DiplomatPlus"
  s.version      = "1.0.0"
  s.summary      = "The third party SDKs unified API lib.Diplomat的升级版"
  s.homepage     = "https://github.com/cloudorz/Diplomat"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' }
  s.author       = { "Cloud" => "cloudcry@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/jingjing401/DiplomatPlus.git", :tag => "#{s.version}" }
  s.frameworks = "SystemConfiguration", "ImageIO", "CoreTelephony"
  s.libraries = "stdc++", "sqlite3", "z"
  s.requires_arc = true
  #s.module_map   = "Sources/module.modulemap"

  s.subspec 'Core' do |core|
    core.source_files = "Sources/*.{h,m}"
    core.resources = "Sources/*.md"
  end

  s.subspec 'Weibo' do |weibo|
    weibo.dependency 'DiplomatPlus/Core'
    weibo.source_files = "Sources/Weibo/*.{h,m}"
    weibo.resources = "Sources/Weibo/*.bundle"
    weibo.vendored_libraries = "Sources/Weibo/*.a"
  end

  s.subspec 'Wechat' do |wechat|
    wechat.dependency 'DiplomatPlus/Core'
    wechat.source_files = "Sources/Wechat/*.{h,m}"
    wechat.vendored_libraries = "Sources/Wechat/*.a"
  end

  s.subspec 'Tencent' do |tencent|
    tencent.dependency 'DiplomatPlus/Core'
    tencent.source_files = "Sources/Tencent/*.{h,m}"
    tencent.vendored_frameworks = "Sources/Tencent/TencentOpenAPI.framework"
  end
  
end
