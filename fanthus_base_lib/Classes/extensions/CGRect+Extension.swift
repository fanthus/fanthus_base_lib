//
//  CGRect+Extension.swift
//  fanthus_base_lib_Example
//
//  Created by Xiushan Fan on 2020/7/1.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGRect {
    
    var center:CGPoint {
        get { return CGPoint.init(x: self.origin.x + self.width/CGFloat(2.0), y: self.origin.y + self.height/CGFloat(2.0)) }
        set { self = CGRect.init(x: newValue.x - self.width/CGFloat(2.0), y: newValue.y - self.height/CGFloat(2.0), width: self.width, height: self.height) }
    }
    
    var upLeft:CGPoint {
        get { return CGPoint.init(x: self.origin.x, y: self.origin.y) }
        set { self = CGRect.init(x: newValue.x, y: newValue.y, width: self.width, height: self.height) }
    }
    
    var upRight:CGPoint {
        get { return CGPoint.init(x: self.origin.x + self.width, y: self.origin.y) }
        set { self = CGRect.init(x: newValue.x - self.width, y: newValue.y, width: self.width, height: self.height) }
    }
    
    var bottomLeft:CGPoint {
        get { return CGPoint.init(x: self.origin.x, y: self.origin.y + self.height) }
        set { self = CGRect.init(x: newValue.x, y: newValue.y - self.height, width: self.width, height: self.height) }
    }
    
    var bottomRight:CGPoint {
        get { return CGPoint.init(x: self.origin.x + self.width, y: self.origin.y + self.height) }
        set { self = CGRect.init(x: newValue.x - self.width, y: newValue.y - self.height, width: self.width, height: self.height) }
    }
    
    var middleUp:CGPoint {
        get { return CGPoint.init(x: self.origin.x + self.width/CGFloat.init(2), y: self.origin.y) }
        set { self = CGRect.init(x: newValue.x - self.width/CGFloat.init(2), y: newValue.y, width: self.width, height: self.height) }
    }
    
    var middleBottom:CGPoint {
        get { return CGPoint.init(x: self.origin.x + self.width/CGFloat.init(2), y: self.origin.y + self.height) }
        set { self = CGRect.init(x: newValue.x - self.width/CGFloat.init(2), y: newValue.y - self.height, width: self.width, height: self.height) }
    }
    
    var middleLeft:CGPoint {
        get { return CGPoint.init(x: self.origin.x, y: self.origin.y + self.height/CGFloat.init(2)) }
        set { self = CGRect.init(x: newValue.x, y: newValue.y - self.height/CGFloat.init(2), width: self.width, height: self.height) }
    }
    
    var middleRight:CGPoint {
        get { return CGPoint.init(x: self.origin.x + self.width, y: self.origin.y + self.height/CGFloat.init(2)) }
        set { self = CGRect.init(x: newValue.x - self.width, y: newValue.y - self.height/CGFloat.init(2), width: self.width, height: self.height) }
    }
    
}
