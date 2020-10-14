//
//  SwiftUtil.swift
//  meetup
//
//  Created by Xiushan Fan on 2020/7/22.
//  Copyright © 2020 Perfect. All rights reserved.
//

import Foundation

/// https://stackoverflow.com/questions/27989094/how-to-unwrap-an-optional-value-from-any-type/32516815#32516815
public func unwrap(any:Any) -> Any {
    let mi = Mirror(reflecting: any)
    if mi.displayStyle != .optional {
        return any
    }
    if mi.children.count == 0 { return NSNull() }
    let (_, some) = mi.children.first!
    return some
}
