//
//  String+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation

extension String {
    
    //获取字符串长度
    var length : Int {
        return characters.count
    }
}

extension Int {
    static func durationToTimer(durtion : Int) -> String {
        return "\(String(format: "%02d",durtion/60))'\(String(format: "%02d",durtion%60))\""
    }
}