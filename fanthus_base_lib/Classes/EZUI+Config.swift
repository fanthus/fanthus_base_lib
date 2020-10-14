//
//  EZUI+Config.swift
//  pick
//
//  Created by Xiushan Fan on 2019/7/8.
//  Copyright © 2019 Soulink. All rights reserved.
//

import UIKit
import SnapKit

public typealias _$ = EZUI_Config
public typealias ezui_vv_t = ()->Void           // Void->Void => vv
public typealias ezui_bv_t = (_ b:Bool) -> Void // bool->Void
public typealias ezui_av_t = (_ obj:Any?) -> Void // any->Void
public typealias ezui_sv_t = (_ str:String) -> Void // string->Void
public typealias ezui_pv_t = (_ p:CGPoint) -> Void // point->Void
public typealias ezui_siv_t = (_ str:String,_ i:Int) -> Void // (str,int)->Void
public typealias ezui_snp_t = ((_ make: ConstraintMaker) -> Void)?  // snap kit make

public enum EZUI_Fonts:String {
    case Bold="PingFangSC-Semibold"
    case Regular="PingFangSC-Regular"
    case Medium="PingFangSC-Medium"
    case Light="PingFangSC-Light"
    case Black="SODA_V7-Black"
    case History="AaXHSJTNon-CommercialUse"
}


public class EZUI_Config {
    public static var TXT_COLOR:String = "000000"
    public static var BG_COLOR:String = "00000000"
    public static var TXT_FONT:String = "PingFangSC-Regular"
    public static var TXT_SIZE:CGFloat = 13
}

/// 常用的 iPhone 视图相关的变量
public extension EZUI_Config {
    static let StatusBarHeight:CGFloat = UIDevice.isPhoneX ? 44 : 20
    static let TopSpan:CGFloat = UIDevice.isPhoneX ? 24 : 0
    static let BottomSpan:CGFloat = UIDevice.isPhoneX ? 34 : 0

    static let NavBarHeight:CGFloat = 44
    static let TabBarHeight:CGFloat = 49
    static let TopWithStatus:CGFloat = StatusBarHeight
    static let TopWithStatusAndNav:CGFloat = StatusBarHeight+NavBarHeight
}
