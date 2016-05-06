//
//  FJAPIHeapler.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/22.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation
import Alamofire

struct FJAPIHeapler {
    static let API_Service = "http://baobab.wandoujia.com/api/v2/"
    static let API_Choice = API_Service+"feed"
    /// 二.发现更多（分类） http://baobab.wandoujia.com/api/v2/categories
    static let API_Discover = API_Service+"categories"
    /// 三. 热门排行(周排行)
    static let API_Popular_Weakly = API_Service+"ranklist?strategy=weekly"
    /// 四.热门排行(月排行)
    static let API_Popular_Monthly = API_Service+"ranklist?strategy=monthly"
    /// 五.热门排行(总排行)
    static let API_Popular_Historical = API_Service+"ranklist?strategy=historical"
    /// 六.发现更多 - 按时间排序          参数：categoryId
    static let API_Discover_Date = API_Service+"videos?strategy=date"
    /// 七.发现更多 - 分享排行版          参数：categoryId
    static let API_Discover_Share = API_Service+"videos?strategy=shareCount"

}