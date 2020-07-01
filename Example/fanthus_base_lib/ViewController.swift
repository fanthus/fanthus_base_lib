//
//  ViewController.swift
//  fanthus_base_lib
//
//  Created by fanxiushan@gmail.com on 06/22/2020.
//  Copyright (c) 2020 fanxiushan@gmail.com. All rights reserved.
//

import UIKit
import HexColors

class ViewController: UIViewController {
    var testView:TestView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        testView = EZUI.addChildView(TestView.init(frame: rect), self.view)
        
        let btn = EZUI.buttonCustom(txt: "", bgColor: "0000aa", superView: self.view)
        btn.addTarget(self, action: #selector(press), for: UIControl.Event.touchUpInside)
        btn.frame = CGRect.init(x: 100, y: 250, width: 100, height: 30)
        
        EZUI.uiview(bgColor: "ff1111", radius: 3, frame: CGRect.init(x: 7, y: 97, width: 6, height: 6), userInterEnabled: false, superView: self.view)
    }
    
    @objc func press() {
        UIView.animate(withDuration: 0.2, animations: {
//            self.testView.frame.upLeft = CGPoint(x: 10, y: 100)
//            self.testView.frame.upRight = CGPoint(x: 10, y: 100)
//            self.testView.frame.bottomLeft = CGPoint(x: 10, y: 100)
            self.testView.frame.bottomRight = CGPoint(x: 10, y: 100)
//            self.testView.frame.middleLeft = CGPoint(x: 10, y: 100)
//            self.testView.frame.middleRight = CGPoint(x: 10, y: 100)
//            self.testView.frame.middleUp = CGPoint(x: 10, y: 100)
//            self.testView.frame.middleBottom = CGPoint(x: 10, y: 100)
        }) { _ in
            //
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

