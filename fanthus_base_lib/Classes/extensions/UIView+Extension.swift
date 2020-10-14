//
//  UIView+Extension.swift
//  brand_base_lib
//
//  Created by Xiushan Fan on 2019/7/9.
//

import Foundation
import UIKit

public extension UIView {
    var size:CGSize { return self.bounds.size }
    
    var left:CGFloat { return self.frame.origin.x }
    
    var top:CGFloat { return self.frame.origin.y }
    
    var right:CGFloat { return self.frame.origin.x + self.frame.size.width }
    
    var bottom:CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    var width:CGFloat { return self.frame.size.width }
    
    var height:CGFloat { return self.frame.size.height }
    
    var leftTop:CGPoint { return self.frame.origin }
    
    var leftCenter:CGPoint { return CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + self.height/2) }
    
    var bottomLeft:CGPoint { return CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + self.height) }
    
    var bottomCenter:CGPoint { return CGPoint(x: self.frame.origin.x + self.width/2, y: self.frame.origin.y + self.height) }
    
    var bottomRight:CGPoint { return CGPoint(x: self.frame.origin.x + self.width, y: self.frame.origin.y + self.height) }
    
    var rightCenter:CGPoint { return CGPoint(x: self.frame.origin.x + self.width, y: self.frame.origin.y + self.height/2) }
    
    var rightTop:CGPoint { return CGPoint(x: self.frame.origin.x + self.width, y: self.frame.origin.y) }
    
    var topCenter:CGPoint { return CGPoint(x: self.frame.origin.x + self.width/2, y: self.frame.origin.y) }

}

public extension UIView {
    static var _TouchSizeKey = "UIView._TouchSizeKey"
    static var _TouchAreaExtendedKey = "UIView._TouchAreaExtendedKey"
    
    var touchSize:CGSize? {
        get {
            if let tscore = objc_getAssociatedObject(self, &UIView._TouchSizeKey) as? CGSize { return tscore }
            return nil
        }
        set { objc_setAssociatedObject(self, &UIView._TouchSizeKey, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    var touchAreaExtended:Bool? {
        get {
            if let touchAreaExtendedVal = objc_getAssociatedObject(self, &UIView._TouchAreaExtendedKey) as? Bool { return touchAreaExtendedVal }
            return nil
        }
        set { objc_setAssociatedObject(self, &UIView._TouchAreaExtendedKey, newValue, .OBJC_ASSOCIATION_RETAIN) }
    }
    
    func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let _ = self.touchAreaExtended, let size = self.touchSize {
            let widthDelta = size.width - self.width
            let heightDelta = size.height - self.height
            let bounds = self.bounds.insetBy(dx: -0.5*widthDelta, dy: -0.5*heightDelta)
            return bounds.contains(point)
        } else {
            return bounds.contains(point)
        }
    }
}
