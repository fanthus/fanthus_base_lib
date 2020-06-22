//
//  CoreGraphicsUtils.swift
//  brand
//
//  Created by Xiushan Fan on 2018/12/26.
//  Copyright © 2018 Soulink. All rights reserved.
//

import Foundation
import UIKit

public class CoreGraphicsUtils {
    
    public static func getGradientLayer(startColor:UIColor,endColor:UIColor,startPoint:CGPoint = CGPoint(x: 0, y: 0),endPoint:CGPoint = CGPoint(x: 0, y: 1)) -> CAGradientLayer {
        let ca = CAGradientLayer()
        ca.colors = [startColor.cgColor, endColor.cgColor]
        ca.startPoint = startPoint
        ca.endPoint = endPoint
        return ca
    }

    public static func imageFromView(view:UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.size, false, UIScreen.main.scale)
        defer {
            UIGraphicsEndImageContext()
        }
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        //返回一个基于当前图形上下文的图片
        let img = UIGraphicsGetImageFromCurrentImageContext()
        //以png格式返回指定图片的数据
        return img
    }
    
    /// 生成一个纯色的指定宽高和圆角的图片
    public static func getPureColorImg(_ color:String, width:CGFloat, height:CGFloat, radius:CGFloat) -> UIImage? {
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath.init(roundedRect: CGRect(x: 0, y: 0, width: width, height: height), cornerRadius: radius)
        context?.addPath(path.cgPath)
        let tcolor = UIColor(color)
        context?.setFillColor(tcolor?.cgColor ?? UIColor.white.cgColor)
        context?.fillPath()
        let img = UIGraphicsGetImageFromCurrentImageContext()
        return img!
    }
}


