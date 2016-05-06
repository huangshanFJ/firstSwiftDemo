//
//  EYEDiscoverModel.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/26.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

struct EYEDiscoverModel {
    var id : Int!
    //分类名
    var name : String!
    //化名
    var alias : String!
    //背景图
    var bgPicture : String!
    //背景色
    var bgColor : String!
    
    init (dict : NSDictionary) {
        self.id = dict["id"] as? Int ?? 0
        self.alias = dict["alias"] as? String ?? ""
        self.bgPicture = dict["bgPicture"] as? String ?? ""
        self.bgColor = dict["bgColor"] as? String ?? ""
    }
}