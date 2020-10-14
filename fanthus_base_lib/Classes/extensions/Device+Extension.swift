//
//  Device.swift
//  brand
//
//  Created by LinYinLong on 2018/5/25.
//  Copyright © 2018年 lyl. All rights reserved.
//

import UIKit
import SystemConfiguration.CaptiveNetwork

public extension UIDevice {
    
    // 废弃这种名称的函数，用 isBezelLessDisplay 替代
    @available(*, unavailable)
    static let isIphoneX: Bool = {
        return UIDevice.modelName.contains("iPhone X")
    }()
    
    static let scale:CGFloat = UIScreen.main.scale
    static let isPhoneX = isBezelLessDisplay
    
    // 是否是全面屏 iPhone
    // discussion:
    //      1. 目前包括的机型为 (X/Xr/Xs/Xs Max)，后续需要不断更新
    //      2. 除了用 modelName 进行判断的方式外，还考虑过使用 ScreenSize 或者 SafeAreaInset
    //          ScreenSize 的问题是后续仍然需要不断更新，
    //          SafeAreaInset 的问题是苹果的 API 并不稳定，iOS 12 上会出现普屏但 Inset 不为 0 的情况
    //          (http://openradar.appspot.com/42372793)
    static let isBezelLessDisplay: Bool = {
        return UIDevice.modelName.contains("iPhone X")
    }()
    
    // 废弃这种名称的函数，用 is320Width() 替代
    @available(*, unavailable)
    static let isIphoneSE: Bool = {
        return UIDevice.modelName.contains("iPhone SE")
    }()
    
    // 是否是小屏 iPhone 手机（5/5c/5s/SE 等宽度为 320 的手机）
    static let is320Width: Bool = {
        let shortSide = min(UIScreen.main.bounds.size.width,
                            UIScreen.main.bounds.size.height)
        return shortSide == 320
    }()
    
    static let isSimulator:Bool = {
        return UIDevice.modelName.contains("Simulator")
    }()
    

    static let modelIdentifier:String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()
    
    static let modelName: String = {
        return mapToDevice(identifier: UIDevice.modelIdentifier)
    }()
    
    static private func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
        #if os(iOS)
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
        default:                                        return identifier
        }
        #elseif os(tvOS)
        switch identifier {
        case "AppleTV5,3": return "Apple TV 4"
        case "AppleTV6,2": return "Apple TV 4K"
        case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
        default: return identifier
        }
        #endif
    }
    
    static let idfvStr:String? = {
        return UIDevice.current.identifierForVendor?.uuidString
    }()
    
    static let osVerStr:String = {
        return UIDevice.current.systemVersion
    }()
    
    static let ssidStr:String? = {
        let interfaces = CNCopySupportedInterfaces()
        if interfaces != nil {
            let interfacesArray = CFBridgingRetain(interfaces) as! Array<AnyObject>
            if interfacesArray.count > 0 {
                let interfaceName = interfacesArray[0] as! CFString
                let ussafeInterfaceData = CNCopyCurrentNetworkInfo(interfaceName)
                if (ussafeInterfaceData != nil) {
                    let interfaceData = ussafeInterfaceData as! Dictionary<String, Any>
                    return interfaceData["SSID"]! as? String
                }
            }
        }
        return nil
    }()
    
    //MARK:微震
    static func backGenertor() {
        if #available(iOS 10.0, *) {
            let feedBackGenertor = UIImpactFeedbackGenerator.init(style: .medium)
            feedBackGenertor.impactOccurred()
        }
    }
}
