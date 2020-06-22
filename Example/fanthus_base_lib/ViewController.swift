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

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel.init(frame: CGRect(x: 0, y: 20, width: 200, height: 60))
        label.text = "Hello world"
        label.backgroundColor = UIColor("0000ff")
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

