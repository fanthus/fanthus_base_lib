//
//  NSAttributedString+Soullink.swift
//  brand
//
//  Created by Xiushan Fan on 2019/1/9.
//  Copyright © 2019 Soulink. All rights reserved.
//

import Foundation
import HexColors

public extension NSAttributedString {
    
    static func imageAttributedString(img:String, rect:CGRect) -> NSAttributedString {
        let img = UIImage.init(named: img)
        let attach = NSTextAttachment.init()
        attach.image = img
        attach.bounds = rect
        let attributeStr = NSMutableAttributedString.init(attachment: attach)
        return attributeStr
    }
    
    static func formatAttributedString(txt:String?,color:String=_$.TXT_COLOR,fontName:EZUI_Fonts = .Regular,size:CGFloat=_$.TXT_SIZE) ->NSAttributedString{
        let font = fontName != nil ? UIFont.init(name: fontName.rawValue, size: size) : UIFont.systemFont(ofSize: size)
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor(color),NSAttributedString.Key.font:font]
        return NSAttributedString(string: txt ?? "",attributes:attributes )
    }

    static func attrStringFrom(text:String, font:EZUI_Fonts = .Regular, size:CGFloat = 13,color:String = "000000", bgColor:String? = nil, lineSpace:CGFloat = 0, underLine:Bool = false,underLineColor:String = "000000",alignment:NSTextAlignment = .left) -> NSAttributedString {
        let attr = NSAttributedString.attrFrom(text: text, font: font, size: size, color: color, bgColor: bgColor, lineSpace: lineSpace, underLine: underLine, underLineColor: underLineColor, alignment: alignment)
        let attrTxt = NSAttributedString.init(string: text, attributes: attr as [NSAttributedString.Key : Any])
        return attrTxt
    }
    
    static func attrFrom(text:String, font:EZUI_Fonts = .Regular, size:CGFloat = 13,color:String = "000000", bgColor:String? = nil, lineSpace:CGFloat = 0, underLine:Bool = false,underLineColor:String = "000000",alignment:NSTextAlignment = .left) -> [NSAttributedString.Key : Any] {
        let paraStyle = NSMutableParagraphStyle.init()
        paraStyle.lineSpacing = lineSpace
        paraStyle.alignment = alignment
        let backColor = (bgColor != nil) ? (UIColor(bgColor!) ?? UIColor.white) : UIColor.clear
        var attribute = [
            NSAttributedString.Key.font:UIFont.init(name: font.rawValue, size: size),
            NSAttributedString.Key.foregroundColor:UIColor(color),
            NSAttributedString.Key.backgroundColor:backColor,
            NSAttributedString.Key.paragraphStyle:paraStyle]
        if underLine {
            attribute[NSAttributedString.Key.underlineColor] = UIColor(underLineColor)
        }
        return attribute
    }
    
}


public extension NSAttributedString {
    
    static func boundSizeOf(txt:String, font:EZUI_Fonts = .Regular, fontSize:CGFloat = 13, lineSpace:CGFloat = 0, constrainSize:CGSize) -> CGSize {
        let attrTxt = self.attrStringFrom(text: txt, font: font, size: fontSize, lineSpace: lineSpace)
        let rect = attrTxt.boundingRect(with: constrainSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        return rect.size
    }
    
    static func boundSizeOf(attributeTxt:NSAttributedString,constrainSize:CGSize) -> CGSize {
        let rect = attributeTxt.boundingRect(with: constrainSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        return rect.size
    }
    
}


