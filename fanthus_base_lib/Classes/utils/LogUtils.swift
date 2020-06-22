//
//  LogUtils.swift
//  AFDateHelper
//
//  Created by Xiushan Fan on 2019/12/20.
//

import UIKit
import CocoaLumberjack

public typealias LogCallBack = (L.Type) -> Void

public class L: NSObject {
    
    static var Debugable = false
    
    public static func configLogger(_ debugable:Bool = false) {
        //调试日志输出到 ASL.
        L.Debugable = debugable
        if L.Debugable {
            DDLog.add(DDOSLogger.sharedInstance)
        }
    }
    
    public static func define(_ cb:LogCallBack?) {
        if !L.Debugable {
            return
        }
        cb?(L.self)
    }
        
    public static func i(_ msg:String="") {
        if !L.Debugable {
            return
        }
        DDLogInfo("[info]:\(msg)")
    }
    
    public static func d(_ msg:String="") {
        if !L.Debugable {
            return
        }
        self.d(tag: "", msg)
    }
    
    public static func d(tag:String="",_ msg:String="") {
        if !L.Debugable {
            return
        }
        let tagStr = tag.count > 0 ? "#\(tag)# " : tag
        DDLogInfo("[debug]:\(tagStr)\(msg)")
    }
       
    public static func w(_ msg:String="") {
        if !L.Debugable {
            return
        }
        DDLogWarn("[warn]:\(msg)")
    }
    
    public static func e(_ msg:String="") {
        if !L.Debugable {
            return
        }
        DDLogError("[error]:\(msg)")
    }
    
    public static func e(tag:String="",_ msg:String="") {
        if !L.Debugable {
            return
        }
        let tagStr = tag.count > 0 ? "#\(tag)# " : tag
        DDLogError("[error]:\(tagStr)\(msg)")
    }
    
    static func v(_ msg:String="") {
        if !L.Debugable {
            return
        }
        DDLogVerbose("[verbose]:\(msg)")
    }
    
}
