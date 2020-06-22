//
//  UIImage+Soulink.swift
//  brand
//
//  Created by shajie on 2018/8/24.
//  Copyright © 2018 Soulink. All rights reserved.
//

import UIKit


// UIImage 相关的扩展函数
public extension UIImage {

    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    func resizedToSquare(_ profileBgImg:UIImage, width:CGFloat = 0) -> UIImage? {
        if width <= 0 {
            return nil
        }
        var resizeSize = CGSize(width: 0, height: 0)
        if profileBgImg.size.height > 0,profileBgImg.size.width > 0 {
            let width = profileBgImg.size.width
            let height = profileBgImg.size.height
            let criticalValue:CGFloat = width
            if width > height,width > criticalValue {
                let shrinkRatio = width/criticalValue
                resizeSize.height = height/shrinkRatio
                return profileBgImg.resized(to: CGSize(width: criticalValue, height: resizeSize.height))
            } else if height > width,height > criticalValue {
                let shrinkRatio = height/criticalValue
                resizeSize.width = width/shrinkRatio
                return profileBgImg.resized(to: CGSize(width: resizeSize.width, height: criticalValue))
            } else {
                return profileBgImg
            }
        }
        return nil
    }
    
    /// 按弧度旋转图片
    ///
    /// - Parameter radians: 弧度值，eg. .pi/2、-.pi
    func rotate(radians:Float) -> UIImage? {
        // https://stackoverflow.com/questions/27092354/rotating-uiimage-in-swift
        var newSize = CGRect(origin: CGPoint.zero, size: self.size).applying(CGAffineTransform(rotationAngle: CGFloat(radians))).size
        // Trim off the extremely small float value to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        // Draw the image at its center
        self.draw(in: CGRect(x: -self.size.width/2, y: -self.size.height/2, width: self.size.width, height: self.size.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        return newImage
    }
    
    /// 按角度旋转图片
    ///
    /// - Parameter degree: 角度值，eg. 30、45、-60
    func rotate(degree: Float) -> UIImage? {
        let rad = Float.pi * degree / 180.0
        return rotate(radians: rad)
    }
}

public extension UIImage {
    /// 通过颜色生成图片
    static func imageWith(color:UIColor) -> UIImage {
        return self.imageWith(color: color,size: CGSize(width: 1, height: 1))
    }
    
    static func imageWith(color:UIColor,size:CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage {
        UIGraphicsBeginImageContext(CGSize.init(width: size.width, height: size.height))
        let context = UIGraphicsGetCurrentContext();
        context?.setFillColor(color.cgColor)
        context?.fill(CGRect.init(x: 0, y: 0, width: size.width, height: size.height))
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
    func imageChangeColor(color:UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        color.setFill()
        let bounds = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIRectFill(bounds)
        self.draw(in: bounds, blendMode: .destinationIn, alpha: 1.0)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}


