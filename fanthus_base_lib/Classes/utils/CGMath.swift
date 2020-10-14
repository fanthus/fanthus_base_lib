//
//  CGMath.swift
//  meetup
//
//  Created by Xiushan Fan on 2020/7/22.
//  Copyright © 2020 Perfect. All rights reserved.
//

import UIKit

//https://gist.github.com/gurgeous/bc0c3d2e748c3b6fe7f2

//
// MARK: CGPoint op point/size/float
//
public func -(l: CGPoint, r: CGPoint) -> CGPoint { return CGPoint(x: l.x - r.x, y: l.y - r.y) }
public func +(l: CGPoint, r: CGPoint) -> CGPoint { return CGPoint(x: l.x + r.x, y: l.y + r.y) }
public func *(l: CGPoint, r: CGPoint) -> CGPoint { return CGPoint(x: l.x * r.x, y: l.y * r.y) }
public func /(l: CGPoint, r: CGPoint) -> CGPoint { return CGPoint(x: l.x / r.x, y: l.y / r.y) }

public func -(l: CGPoint, r: CGSize) -> CGPoint { return CGPoint(x: l.x - r.width, y: l.y - r.height) }
public func +(l: CGPoint, r: CGSize) -> CGPoint { return CGPoint(x: l.x + r.width, y: l.y + r.height) }
public func *(l: CGPoint, r: CGSize) -> CGPoint { return CGPoint(x: l.x * r.width, y: l.y * r.height) }
public func /(l: CGPoint, r: CGSize) -> CGPoint { return CGPoint(x: l.x / r.width, y: l.y / r.height) }

public func -(l: CGPoint, r: CGFloat) -> CGPoint { return CGPoint(x: l.x - r, y: l.y - r) }
public func +(l: CGPoint, r: CGFloat) -> CGPoint { return CGPoint(x: l.x + r, y: l.y + r) }
public func *(l: CGPoint, r: CGFloat) -> CGPoint { return CGPoint(x: l.x * r, y: l.y * r) }
public func /(l: CGPoint, r: CGFloat) -> CGPoint { return CGPoint(x: l.x / r, y: l.y / r) }

public func -=( l: inout CGPoint, r: CGPoint) { l = l - r }
public func +=( l: inout CGPoint, r: CGPoint) { l = l + r }
public func *=( l: inout CGPoint, r: CGPoint) { l = l * r }
public func /=( l: inout CGPoint, r: CGPoint) { l = l / r }

public func -=( l: inout CGPoint, r: CGSize) { l = l - r }
public func +=( l: inout CGPoint, r: CGSize) { l = l + r }
public func *=( l: inout CGPoint, r: CGSize) { l = l * r }
public func /=( l: inout CGPoint, r: CGSize) { l = l / r }

public func -=( l: inout CGPoint, r: CGFloat) { l = l - r }
public func +=( l: inout CGPoint, r: CGFloat) { l = l + r }
public func *=( l: inout CGPoint, r: CGFloat) { l = l * r }
public func /=( l: inout CGPoint, r: CGFloat) { l = l / r }


//
// MARK: CGSize op size/float
//
public func -(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width - r.width, height: l.height - r.height) }
public func +(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width + r.width, height: l.height + r.height) }
public func *(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width * r.width, height: l.height * r.height) }
public func /(l: CGSize, r: CGSize) -> CGSize { return CGSize(width: l.width / r.width, height: l.height / r.height) }

public func -(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width - r, height: l.height - r) }
public func +(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width + r, height: l.height + r) }
public func *(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width * r, height: l.height * r) }
public func /(l: CGSize, r: CGFloat) -> CGSize { return CGSize(width: l.width / r, height: l.height / r) }

public func -=( l: inout CGSize, r: CGSize) { l = l - r }
public func +=( l: inout CGSize, r: CGSize) { l = l + r }
public func *=( l: inout CGSize, r: CGSize) { l = l * r }
public func /=( l: inout CGSize, r: CGSize) { l = l / r }

public func -=( l: inout CGSize, r: CGFloat) { l = l - r }
public func +=( l: inout CGSize, r: CGFloat) { l = l + r }
public func *=( l: inout CGSize, r: CGFloat) { l = l * r }
public func /=( l: inout CGSize, r: CGFloat) { l = l / r }


/// 额外补充下 CGRect 的操作符
public func -(l: CGRect, r: CGRect) -> CGRect {
    let origin = l.origin - r.origin
    let size = l.size - r.size
    return CGRect.init(x: origin.x, y: origin.y, width: size.width, height: size.height)
}
    
public func +(l: CGRect, r: CGRect) -> CGRect {
    let origin = l.origin + r.origin
    let size = l.size + r.size
    return CGRect.init(x: origin.x, y: origin.y, width: size.width, height: size.height)
}
