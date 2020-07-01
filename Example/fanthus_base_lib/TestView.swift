//
//  TestView.swift
//  fanthus_base_lib_Example
//
//  Created by Xiushan Fan on 2020/7/1.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
