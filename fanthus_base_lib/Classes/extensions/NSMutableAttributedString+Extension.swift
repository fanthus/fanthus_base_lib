//
//  NSMutableAttributedString+Soullink.swift
//  brand
//
//  Created by Xiushan Fan on 2019/4/9.
//  Copyright © 2019 Soulink. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    static func mutableAttrStringFrom(text:String, font:EZUI_Fonts = .Regular, size:CGFloat = 13,color:String = "000000", bgColor:String? = nil, lineSpace:CGFloat = 0, underLine:Bool = false,underLineColor:String = "000000",alignment:NSTextAlignment = .left) -> NSMutableAttributedString {
        let attr = NSAttributedString.attrFrom(text: text, font: font, size: size, color: color, bgColor: bgColor, lineSpace: lineSpace, underLine: underLine, underLineColor: underLineColor, alignment: alignment)
        let attrTxt = NSMutableAttributedString.init(string: text, attributes: attr as [NSAttributedString.Key : Any])
        return attrTxt
    }
}
