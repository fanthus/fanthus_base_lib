//
//  UIBezierPath+Soullink.swift
//  brand
//
//  Created by Xiushan Fan on 2018/11/16.
//  Copyright © 2018 Soulink. All rights reserved.
//

import Foundation
import UIKit

extension UIBezierPath {
    
    //构建整体带圆角的矩形Path
    static public func buildAllCornerRadiusPath(_ rect:CGRect, radius:CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath.init()
        bezierPath.move(to: CGPoint(x: 0, y: radius))
        bezierPath.addArc(withCenter: CGPoint(x: radius, y: radius), radius: radius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(Double.pi*3/2), clockwise: true)
        bezierPath.addLine(to: CGPoint(x: rect.width-radius, y: 0))
        bezierPath.addArc(withCenter: CGPoint(x: rect.width - radius, y: radius), radius: radius, startAngle: CGFloat(Double.pi*3/2), endAngle: CGFloat(Double.pi*2), clockwise: true)
        bezierPath.addLine(to: CGPoint(x: rect.width, y: rect.height - radius))
        bezierPath.addArc(withCenter: CGPoint(x: rect.width - radius, y: rect.height - radius), radius: radius, startAngle: 0, endAngle:CGFloat(Double.pi/2), clockwise: true)
        bezierPath.addLine(to: CGPoint(x: radius, y: rect.height))
        bezierPath.addArc(withCenter: CGPoint(x: radius, y: rect.height-radius), radius: radius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: true)
        bezierPath.addLine(to: CGPoint(x: 0, y: radius))
        bezierPath.close()
        return bezierPath
    }
    
    
    //构建底部带圆角的矩形Path
    static public func buildBottomCornerRadiusPath(_ rect:CGRect, radius:CGFloat) -> UIBezierPath {
        let bezierPath = UIBezierPath.init()
        bezierPath.move(to: CGPoint(x: 0, y: 0))
        bezierPath.addLine(to: CGPoint(x: rect.width, y: 0))
        bezierPath.addLine(to: CGPoint(x: rect.width, y: rect.height - radius))
        bezierPath.addArc(withCenter: CGPoint(x: rect.width - radius, y: rect.height - radius), radius: radius, startAngle: 0, endAngle:CGFloat(Double.pi/2), clockwise: true)
        bezierPath.addLine(to: CGPoint(x: radius, y: rect.height))
        bezierPath.addArc(withCenter: CGPoint(x: radius, y: rect.height-radius), radius: radius, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: true)
        bezierPath.addLine(to: CGPoint(x: 0, y: 0))
        bezierPath.close()
        return bezierPath
    }
}
