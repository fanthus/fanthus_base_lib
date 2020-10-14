//
//  Bundle+Extension.swift
//  meetup
//
//  Created by Xiushan Fan on 2020/7/21.
//  Copyright © 2020 Perfect. All rights reserved.
//

import Foundation

public extension Bundle {
    
    static let appVer: String? = {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }()
    
    static let vendor: String? = {
        return Bundle.main.object(forInfoDictionaryKey: "VendorName") as? String
    }()
    
    static let bundleIdentifier:String? = {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String
    }()
    
}
