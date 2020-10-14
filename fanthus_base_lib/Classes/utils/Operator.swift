//
//  Operator.swift
//  meetup
//
//  Created by Xiushan Fan on 2020/7/21.
//  Copyright © 2020 Perfect. All rights reserved.
//

import UIKit


/// NilCoalescingPrecedence 的优先级见这里 https://github.com/apple/swift-evolution/blob/master/proposals/0077-operator-precedence.md
infix operator ??? : NilCoalescingPrecedence
/// ??? 自定义操作符用来解决字符串插值的问题
/// - Parameters:
///   - optional: 插值对象
///   - defaultValue: 默认值，字符串
/// - Returns: 根据 optional 是否为 nil 来返回对应字符串.
public func ???<T>(optional:T?, defaultValue: @autoclosure() -> String) -> String {
    switch optional {
    case let value?:
        return String(describing: value)
    case nil:
        return defaultValue()
    }
}

