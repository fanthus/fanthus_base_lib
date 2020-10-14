//
//  Tasks.swift
//  brand_base_lib_Example
//
//  Created by Xiushan Fan on 2020/6/23.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class Tasks {
    static func delay(_ delay:Double,main:Bool=true, closure:@escaping ()->()) {
        if main {
            DispatchQueue.main.asyncAfter(
                deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
        } else {
            DispatchQueue.global(qos: .background).asyncAfter(
                deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
        }
    }
}
