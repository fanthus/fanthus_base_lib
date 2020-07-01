# fanthus_base_lib

[![CI Status](https://img.shields.io/travis/fanxiushan@gmail.com/fanthus_base_lib.svg?style=flat)](https://travis-ci.org/fanxiushan@gmail.com/fanthus_base_lib)
[![Version](https://img.shields.io/cocoapods/v/fanthus_base_lib.svg?style=flat)](https://cocoapods.org/pods/fanthus_base_lib)
[![License](https://img.shields.io/cocoapods/l/fanthus_base_lib.svg?style=flat)](https://cocoapods.org/pods/fanthus_base_lib)
[![Platform](https://img.shields.io/cocoapods/p/fanthus_base_lib.svg?style=flat)](https://cocoapods.org/pods/fanthus_base_lib)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

fanthus_base_lib is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'fanthus_base_lib' 
```

## Useage

每次库更新完毕之后需要做的事情如下

1. 使用 `git tag` 命令查看当前的最新的版本号，这里比如说为 0.0.3
2. 将本次改动更新到(`git commit`  & `git push`)服务器 
3. 编辑 `fanthus_base_lib.podspec` 文件，更新文件的版本号 `s.version` 为 0.0.4
4. 使用命令 `git tag -m '添加拓展' 0.0.4` 为当次库打 tag
5. 使用 `git push --tag` 将本地 tag 推送到远程服务器

然后在使用侧的 podfile 里更新对应的 tag 为 0.0.4，如下

```
pod 'fanthus_base_lib', :git => "git@github.com:fanthus/fanthus_base_lib.git", :tag => '0.0.4'
```

执行 pod install 则在使用侧就能用到更改后的 tag 了.

## Author

fanxiushan@gmail.com, fanxiushan@soullink.com.cn

## License

fanthus_base_lib is available under the MIT license. See the LICENSE file for more info.
