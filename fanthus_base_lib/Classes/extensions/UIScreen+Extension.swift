//
//  UIScreen+Extension.swift
//  AFNetworking
//
//  Created by Xiushan Fan on 2019/7/17.
//

import Foundation
import UIKit

public extension UIScreen {
    static func screenWidth()->CGFloat{
        return UIScreen.main.bounds.width
    }
    
    static func screenHeight()-> CGFloat{
        return UIScreen.main.bounds.height
    }
    
    static func scale() -> CGFloat {
        return UIScreen.main.scale
    }
}



