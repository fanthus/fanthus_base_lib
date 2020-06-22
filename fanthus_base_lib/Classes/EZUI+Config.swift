//
//  EZUI+Config.swift
//  pick
//
//  Created by Xiushan Fan on 2019/7/8.
//  Copyright © 2019 Soulink. All rights reserved.
//

import UIKit

public class EZUI_Config {
    public static let TXT_COLOR:String = "000000"
    public static let TXT_SIZE:CGFloat = 13
    public static let TXT_FONT:String = EZUI_Fonts.Regular.rawValue
    public static let BG_COLOR:String = "00000000"
    
}

public enum EZUI_Fonts:String {
    case Bold="PingFangSC-Semibold"
    case Regular="PingFangSC-Regular"
    case Medium="PingFangSC-Medium"
    case Light="PingFangSC-Light"
    case Black="SODA_V7-Black"
    case History="AaXHSJTNon-CommercialUse"
}
