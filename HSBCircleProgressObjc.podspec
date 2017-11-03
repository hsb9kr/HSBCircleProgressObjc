#
# Be sure to run `pod lib lint HSBCircleProgressObjc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HSBCircleProgressObjc'
  s.version          = '0.0.1'
  s.summary          = 'Circle Progress View'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
HSBCircleProgressObjc provides circle progress view.
                       DESC

  s.homepage         = 'https://github.com/hsb9kr/HSBCircleProgressObjc'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Hong Sangbo' => 'hsb9kr@gmail.com' }
  s.source           = { :git => 'https://github.com/hsb9kr/HSBCircleProgressObjc.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HSBCircleProgressObjc/Classes/*.{h,m}'
end
