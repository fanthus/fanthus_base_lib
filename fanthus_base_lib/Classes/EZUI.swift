//
//  EZUI.swift
//  pick
//
//  Created by Xiushan Fan on 2019/7/8.
//  Copyright © 2019 Soulink. All rights reserved.
//

import UIKit
import HexColors
import SnapKit
import Toaster

public typealias _$ = EZUI_Config
public typealias ezui_vv_t = ()->Void           // Void->Void => vv
public typealias ezui_bv_t = (_ b:Bool) -> Void // bool->Void
public typealias ezui_snp_t = ((_ make: ConstraintMaker) -> Void)?  // snap kit make

public class EZUI:NSObject {
    
    public static func buttonCustom(txt:String="",txtInset:UIEdgeInsets?=nil,color:String=_$.TXT_COLOR,font:EZUI_Fonts = .Regular,size:CGFloat=_$.TXT_SIZE,bgColor:String?=nil,img:String? = nil,imgEdgeInsets:UIEdgeInsets? = nil,bgImg:String?=nil,radius:CGFloat? = nil,superView:UIView?=nil,_ closure:ezui_snp_t=nil)->UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(txt, for: UIControl.State.normal)
        if txtInset != nil {
            btn.titleEdgeInsets = txtInset!
        }
        btn.titleLabel?.font = UIFont.init(name: font.rawValue, size: size)
        btn.setTitleColor(UIColor(color), for: UIControl.State.normal)
        if let bg = bgColor {
            btn.backgroundColor = UIColor(bg)
        }
        
        if bgImg != nil {
            btn.setBackgroundImage(UIImage(named:bgImg!), for: .normal)
        }
        
        if img != nil {
            btn.setImage(UIImage(named:img!), for: .normal)
        }
        
        if imgEdgeInsets != nil {
            btn.imageEdgeInsets = imgEdgeInsets!
        }
        
        if radius != nil {
            setLayer(view: btn, radius: radius!)
        }
        
        superView?.addSubview(btn)
        if let c = closure {
            btn.snp.makeConstraints(c)
        }
        return btn
    }
    
    public static func button(buttonType:UIButton.ButtonType = .system, txt:String="",txtInset:UIEdgeInsets?=nil,color:String=_$.TXT_COLOR,font:EZUI_Fonts = .Regular,size:CGFloat=_$.TXT_SIZE,bgColor:String?=nil,img:String? = nil,imgEdgeInsets:UIEdgeInsets? = nil,bgImg:String?=nil,radius:CGFloat? = nil,tint:UIColor? = nil,superView:UIView?=nil,_ closure:ezui_snp_t=nil)->UIButton {
        let btn = UIButton(type: buttonType)
        if txtInset != nil {
            btn.titleEdgeInsets = txtInset!
        }
        btn.setTitle(txt, for: UIControl.State.normal)
        btn.titleLabel?.font = UIFont.init(name: font.rawValue, size: size)
        btn.setTitleColor(UIColor(color), for: UIControl.State.normal)
        if let bg = bgColor {
            btn.backgroundColor = UIColor(bg)
        }
        
        
        if tint != nil {
            btn.tintColor = tint!
        }
        if bgImg != nil {
            btn.setBackgroundImage(UIImage(named:bgImg!), for: .normal)
        }
        if img != nil {
            btn.setImage(UIImage(named:img!), for: .normal)
        }
        if imgEdgeInsets != nil {
            btn.imageEdgeInsets = imgEdgeInsets!
        }
        
        if radius != nil {
            setLayer(view: btn, radius: radius!)
        }
        
        superView?.addSubview(btn)
        if let c = closure {
            btn.snp.makeConstraints(c)
        }
        return btn
    }
    
    public static func borderButton(borderColor:String = "ffffff",borderWidth:CGFloat = 0, cornerRadius:CGFloat = 0, title:String = "", titleColor:String = "ffffff", font:EZUI_Fonts = .Regular, size:CGFloat = 11, target:Any, action:Selector, superview:UIView) -> UIButton {
        let btn = UIButton.init(type: .custom)
        btn.layer.cornerRadius = cornerRadius
        btn.layer.masksToBounds = true
        if let color = UIColor(borderColor)?.cgColor {
            btn.layer.borderColor = color
        }
        btn.layer.borderWidth = borderWidth
        btn.setTitle(title, for: UIControl.State.normal)
        btn.setTitleColor(UIColor(titleColor), for: UIControl.State.normal)
        btn.addTarget(target, action: action, for:.touchUpInside)
        btn.titleLabel?.font = UIFont.init(name: font.rawValue, size: size)
        superview.addSubview(btn)
        return btn
    }
    
    public static func uiview(bgColor:String=_$.BG_COLOR,radius:CGFloat=0.0, frame:CGRect=CGRect.zero, userInterEnabled:Bool=false, superView:UIView?=nil,_ closure:ezui_snp_t=nil) -> UIView {
        let uiview = UIView(frame:frame)
        uiview.backgroundColor = UIColor(bgColor)
        uiview.isUserInteractionEnabled = userInterEnabled
        if radius>0.0 {
            uiview.layer.cornerRadius = radius
            uiview.layer.masksToBounds = true
        }
        superView?.addSubview(uiview)
        if let c = closure {
            uiview.snp.makeConstraints(c)
        }
        return uiview
    }
    
    public static func setMask(_ target:UIImageView,_ mask:String,_ width:CGFloat,_ height:CGFloat) {
        let maskView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        maskView.contentMode = .scaleAspectFit
        maskView.image = UIImage(named:mask)
        maskView.bounds = target.bounds
        target.mask = maskView
    }
    
    public static func roundCorners(view:UIView,radius:CGFloat=0.0,corners:UIRectCorner=[.bottomLeft, .bottomRight]) {
        let path = UIBezierPath(roundedRect:view.bounds,
                                byRoundingCorners:corners,
                                cornerRadii: CGSize(width: radius, height:  radius))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        view.layer.mask = maskLayer
    }
    
    public static func setLayer(view:UIView,radius:CGFloat=0.0,borderWidth:CGFloat=0.0,borderColor:String?=nil) {
        setLayer(views: [view], radius: radius, borderWidth: borderWidth, borderColor: borderColor)
    }
    
    public static func setLayer(views:[UIView],radius:CGFloat=0.0,borderWidth:CGFloat=0.0,borderColor:String?=nil) {
        if views.count == 0 { return }
        for view in views {
            if radius > 0.0 {
                view.layer.cornerRadius = radius
                view.layer.masksToBounds = true
            }
            if borderWidth > 0.0 {
                view.layer.borderWidth = borderWidth
            }
            if let color = borderColor {
                view.layer.borderColor = UIColor(color)?.cgColor
            }
        }
    }
    
    
    public static func addChildView(_ view:UIView?,_ superView:UIView?=nil,_ closure:ezui_snp_t=nil) -> UIView? {
        if let v = view {
            superView?.addSubview(v)
            if let c = closure {
                v.snp.makeConstraints(c)
            }
        }
        return view
    }
    
    public static func layout<T:UIView>(_ child:T?,_ superView:UIView?=nil,_ closure:ezui_snp_t=nil) -> T? {
        return EZUI.addChildView(child,superView,closure) as? T
    }
    
    public static func attachTo<T:UIView>(_ view:T?,_ superView:UIView?=nil,_ closure:ezui_snp_t=nil)->T? {
        if let v = view {
            superView?.addSubview(v)
            if let c = closure {
                v.snp.makeConstraints(c)
            }
        }
        return view
    }
    
    @discardableResult
    public static func label(txt:String?="",color:String=_$.TXT_COLOR,fontName:EZUI_Fonts = .Regular,size:CGFloat=_$.TXT_SIZE,align:NSTextAlignment = .center,superView:UIView?=nil,lineNum:Int=0,_ closure:ezui_snp_t=nil) -> UILabel {
        let lab = UILabel()
        lab.textColor = UIColor(color)
        let font = fontName != nil ? UIFont.init(name: fontName.rawValue, size: size) : UIFont.systemFont(ofSize: size)
        lab.font = font
        lab.textAlignment = align
        lab.text = txt
        lab.numberOfLines = lineNum
        superView?.addSubview(lab)
        if let c = closure {
            lab.snp.makeConstraints(c)
        }
        return lab
    }
    
    @discardableResult
    public static func imageView(imgName:String?, superView:UIView?=nil,_ w:CGFloat? = nil,_ h:CGFloat? = nil,_ mask:String? = nil,stretchXPercent:CGFloat?=nil,stretchYPercent:CGFloat?=nil, _ closure:ezui_snp_t=nil) -> UIImageView {
        let img = UIImageView()
        if w != nil && h != nil {
            img.frame.size = CGSize(width: w!, height: h!)
            if mask != nil {
                setMask(img, mask!, w!, h!)
            }
        }
        if imgName != nil {
            var ori = UIImage(named: imgName!)
            if ori != nil && stretchXPercent != nil && stretchYPercent != nil {
                img.image = ori!.stretchableImage(withLeftCapWidth: Int(ori!.size.width * stretchXPercent!), topCapHeight: Int(ori!.size.width * stretchYPercent!))
            } else {
                img.image = ori
            }
        }
        img.clipsToBounds = true
        superView?.addSubview(img)
        if let c = closure {
            img.snp.makeConstraints(c)
        }
        return img
    }
    
    @discardableResult
    public static func textView(txt:String="",color:String=_$.TXT_COLOR,fontName:EZUI_Fonts? = .Regular,size:CGFloat=_$.TXT_SIZE,bgColor:String?=nil,superView:UIView?=nil,_ closure:ezui_snp_t=nil)->UITextView {
        let textview = UITextView(frame:CGRect.zero)
        textview.text = txt
        textview.isScrollEnabled = false
        //        textview.placeholder = hint
        //        textview.
        let font = fontName != nil ? UIFont.init(name: fontName!.rawValue, size: size) : UIFont.systemFont(ofSize: size)
        textview.font = font
        textview.textColor = UIColor(color)
        if let bg = bgColor {
            textview.backgroundColor = UIColor(bg)
        }
        textview.isEditable = false
        textview.translatesAutoresizingMaskIntoConstraints = false
        superView?.addSubview(textview)
        if let c = closure {
            textview.snp.makeConstraints(c)
        }
        return textview
    }
    
    
    public static func textField(hint:String="",color:String=_$.TXT_COLOR,fontName:EZUI_Fonts? = .Regular,size:CGFloat=_$.TXT_SIZE,bgColor:String?=nil,superView:UIView?=nil,_ closure:ezui_snp_t=nil)->UITextField {
        let field = UITextField(frame:CGRect.zero)
        field.placeholder = hint
        let font = fontName != nil ? UIFont.init(name: fontName!.rawValue, size: size) : UIFont.systemFont(ofSize: size)
        field.font = font
        field.textColor = UIColor(color)
        if let bg = bgColor {
            field.backgroundColor = UIColor(bg)
        }
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        superView?.addSubview(field)
        if let c = closure {
            field.snp.makeConstraints(c)
        }
        return field
    }
    
    public static func formatText(target:UITextView?,txt:String?="",color:String=_$.TXT_COLOR,fontName:EZUI_Fonts = .Regular,size:CGFloat=_$.TXT_SIZE,bgColor:String?=nil) {
        if(fontName != nil) {
            target?.font = UIFont.init(name: fontName.rawValue, size: size)
        } else {
            target?.font = UIFont.systemFont(ofSize: size)
        }
        target?.text = txt
        target?.textColor = UIColor(color)
        if let bg = bgColor {
            target?.backgroundColor = UIColor(bg)
        }
    }
    
    public static func screenWidth()->CGFloat{
        return UIScreen.main.bounds.width
    }
    
    public static func removeConstraintsAndHidden(_ view:UIView?, remove:Bool=true, hide:Bool=true) {
        if remove {
            view?.snp.removeConstraints()
        }
        if hide {
            view?.isHidden = true
        }
    }
    
    public static func translate(_ target:UIView?,_ dx:CGFloat,_ dy:CGFloat) {
        target?.transform = (target?.transform.translatedBy(x: dx, y: dy))!
    }
    
    public static func height(txt:String?,wid:CGFloat,font:String,fontSize:CGFloat) -> CGFloat {
        if nil == txt {
            return 0
        }
        
        let frame = NSString(string: txt!).boundingRect(
            with: CGSize(width: wid, height: .infinity),
            options: [.usesFontLeading, .usesLineFragmentOrigin],
            attributes: [.font : UIFont.init(name: font, size: fontSize)],
            context: nil)
        
        let height = frame.size.height
        return height
    }
    
    public enum ToastType {
        case None   //只是文字
        case Check  //对勾
        case Error  //叉号
    }
    
    public static func showInFullWindow(_ view:UIView) {
        let window = UIApplication.shared.keyWindow!
        view.frame = window.bounds
        window.addSubview(view)
    }
    
    public static func showToastView(_ toastView:UIView, frame:CGRect, duration:Double) {
        let maskView = self.maskView()
        self.showInFullWindow(maskView)
        toastView.frame = frame
        maskView.addSubview(toastView)
        toastView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [],  animations: {
            toastView.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        })
    }
    
    private static func maskView() -> UIView {
        let maskView = uiview()
        maskView.backgroundColor = UIColor.clear
        maskView.isUserInteractionEnabled = true
        return maskView
    }
    
    public static func pop(_ view:UIView) {
        let keyFrame = CAKeyframeAnimation(keyPath: "transform.scale")
        keyFrame.duration = 0.3
        keyFrame.values = [0.1, 0.2, 0.3, 0.5, 0.8, 1.3, 1.0]
        keyFrame.calculationMode = kCAAnimationCubic
        view.layer.add(keyFrame, forKey: "scale")
    }
    

    
   
    
    /// 隐藏系统导航栏底部的细线
    static func toggleSepLineInNavBar(_ nav:UINavigationController?,_ hidden:Bool=true) {
        //  - navigationBar subviews stack
        //      - _UIBarBackground
        //          - UIImageView => 为要隐藏的细线视图 frame = (0 88; 414 0.333333)
        //          - UIVisualEffectView
        //      - _UINavigationBarLargeTitleView
        //      - _UINavigationBarContentView
        //      - _UINavigationBarModernPromptView
        let v = nav?.navigationBar.subviews.first
        let sep = v?.subviews.first
        sep?.isHidden = hidden
        
        // more tricky, iOS 12 上在 viewDidLoad 中调用上述代码无效( bar.subviews 为空)
        // https://stackoverflow.com/questions/19226965/how-to-hide-uinavigationbar-1px-bottom-line
        if #available(iOS 12.0, *) {
            nav?.navigationBar.setValue(true, forKey: "hidesShadow")
        }
    }
    
    public static func convertRect(from:UIView,to:UIView?=nil)->CGRect {
        return from.convert(from.frame, to: to)
    }
    
    public static func setStatusBg(_ color:UIColor) {
        if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
            statusbar.backgroundColor = color
        }
    }
    
    public static func setShadow(_ vs:[UIView?],_ alpha:Float=0.18,_ radius:CGFloat=10,_ offset:CGSize? = nil) {
        for v in vs {
            if let v = v {
                v.clipsToBounds = false
                v.layer.shadowColor = UIColor.black.cgColor
                v.layer.shadowOpacity = alpha
                if offset != nil {
                    v.layer.shadowOffset = offset!
                }
                v.layer.shadowRadius = radius
            }
        }
    }
    
    public static func textWidth(txt:String?,font:EZUI_Fonts = .Regular,size:CGFloat=_$.TXT_SIZE)->CGFloat? {
        if let txt=txt,let font = UIFont(name: font.rawValue, size: size) {
            let fontAttributes = [NSAttributedString.Key.font: font]
            let size = (txt as NSString).size(withAttributes: fontAttributes)
            return size.width
        }
        return nil
    }
    
    @discardableResult
    public static func addGradientLayer(view:UIView?,startColor:String,endColor:String,startPoint:CGPoint,endPoint:CGPoint,frame:CGRect)->CAGradientLayer {
        let ca = CAGradientLayer()
        if let cg1 = UIColor(startColor)?.cgColor, let cg2 = UIColor(endColor)?.cgColor {
            ca.colors = [cg1, cg2]
        }
        ca.startPoint = startPoint
        ca.endPoint = endPoint
        ca.frame = frame
        //        view?.layer.addSublayer(ca)
        view?.layer.insertSublayer(ca, at: 0)
        return ca
    }
}

// MARK: 颜色相关
extension EZUI {
    public static func color(_ color:String?) -> UIColor {
        if let tcolor = color {
            return UIColor(tcolor) ?? UIColor.clear
        }
        return UIColor.clear
    }
    
    public static func randomColor() -> UIColor {
        let red:CGFloat = EZUI.randomNum(255)
        let green:CGFloat = EZUI.randomNum(255)
        let blue:CGFloat = EZUI.randomNum(255)
        let alpha:CGFloat = EZUI.randomNum(100)
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public static func randomNum(_ upperBounds:UInt32) -> CGFloat {
        let num:CGFloat = CGFloat(arc4random()%upperBounds)/CGFloat(upperBounds)
        return num
    }
}



// MARK: 动画相关
extension EZUI {
    public static func anim(_ target:UIView?,_ during:Double=0.2, from:CGRect?=nil, to:CGRect?, onFinish:ezui_bv_t?=nil) {
        guard let target=target,let to=to else {
            onFinish?(false)
            return
        }
        if let f = from {
            target.frame = f
        }
        UIView.animate(withDuration: during, animations: {
            target.frame = to
        }, completion: onFinish)
    }
    
    public static func anim(during:Double=0.2, to:ezui_vv_t?, onFinish:ezui_bv_t?=nil) {
        guard let to=to else {
            onFinish?(false)
            return
        }
        
        UIView.animate(withDuration: during, animations: {
            to()
        }, completion: onFinish)
    }
    
}

// MARK: 绘制相关
extension EZUI {
    
    
    /// 给某个 view 添加虚线，使用 CAShapeLayer 实现
    ///
    /// - Parameters:
    ///   - view: 待添加虚线的 view 视图，虚线区域占满 view 空间
    ///   - lineLength: 虚线长度
    ///   - lineSpacing: 虚线间隔
    ///   - lineColor: 虚线颜色
    ///   - vertical: 横线还是竖线（带角度的以后慢慢改吧）
    /// - Returns: 虚线 Layer
    @discardableResult
    public static func drawDashLine(on view:UIView,
                             lineLength:CGFloat,
                             lineWidth:CGFloat,
                             lineSpacing:CGFloat,
                             lineColor:UIColor,
                             vertical:Bool = false) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.bounds = view.bounds
        
        if vertical {
            layer.position = CGPoint(x: view.bounds.size.width, y: view.bounds.size.height / 2)
        } else {
            layer.position = CGPoint(x: view.bounds.size.width / 2, y: view.bounds.size.height)
        }
        
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = lineColor.cgColor
        layer.lineWidth = lineWidth
        layer.lineJoin = kCALineJoinRound
        layer.lineCap = kCALineCapRound
        layer.lineDashPattern = [lineLength, lineSpacing] as [NSNumber]
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        if vertical {
            path.addLine(to: CGPoint(x: 0, y: view.bounds.size.height))
        } else {
            path.addLine(to: CGPoint(x: view.bounds.size.width, y: 0))
        }
        
        layer.path = path.cgPath
        
        view.layer.addSublayer(layer)
        return layer
    }
    
}
