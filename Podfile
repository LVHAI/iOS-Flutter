# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

flutter_path = './flutter_project'#可以是相对路径也可以是决定路径，指向你创建的flutter的项目
load File.join(flutter_path, '.ios', 'Flutter', 'podhelper.rb')

target 'iOS_project' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  install_all_flutter_pods(flutter_path)
  # Pods for iOS_project
end
