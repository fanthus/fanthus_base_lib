//
//  UIView+Extension.swift
//  brand_base_lib
//
//  Created by Xiushan Fan on 2019/7/9.
//

import Foundation
import UIKit

public extension UIView {
    var size:CGSize {
        return self.bounds.size
    }
    
    var left:CGFloat {
        return self.frame.origin.x
    }
    
    var top:CGFloat {
        return self.frame.origin.y
    }
    
    var right:CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    var bottom:CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    var width:CGFloat {
        return self.frame.size.width
    }
    
    var height:CGFloat {
        return self.frame.size.height
    }
    
    var leftTop:CGPoint {
        return self.frame.origin
    }
    
    var leftCenter:CGPoint {
        return CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + self.height/2)
    }
    
    var bottomLeft:CGPoint {
        return CGPoint(x: self.frame.origin.x, y: self.frame.origin.y + self.height)
    }
    
    var bottomCenter:CGPoint {
        return CGPoint(x: self.frame.origin.x + self.width/2, y: self.frame.origin.y + self.height)
    }
    
    var bottomRight:CGPoint {
        return CGPoint(x: self.frame.origin.x + self.width, y: self.frame.origin.y + self.height)
    }
    
    var rightCenter:CGPoint {
        return CGPoint(x: self.frame.origin.x + self.width, y: self.frame.origin.y + self.height/2)
    }
    
    var rightTop:CGPoint {
        return CGPoint(x: self.frame.origin.x + self.width, y: self.frame.origin.y)
    }
    
    var topCenter:CGPoint {
        return CGPoint(x: self.frame.origin.x + self.width/2, y: self.frame.origin.y)
    }
    
    
    
}
