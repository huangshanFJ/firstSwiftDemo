//
//  EYEPopularModel.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/26.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

struct VideoModel {
    var id : Int!
    var date : Int32!
    var idx : Int!
    var title : String!
    var description : String!
    var playUrl : String!
    
    var collectionCount : Int!
    var shareCount : Int!
    var replyCount : Int!
    var feed : String!
    var blurred : String!
    
    init(dict: NSDictionary) {
        self.id = dict["id"] as? Int ?? 0
        self.date = dict["date"] as? Int32 ?? 0
        self.idx = dict["idx"] as? Int ?? 0
        self.title = dict["title"] as? String ?? ""
        self.description  = dict["description"] as? String ?? ""
        self.playUrl = dict["playUrl"] as? String ?? ""
        
        let consumptionDic = dict["consumption"] as? NSDictionary
        if let consumption = consumptionDic {
            self.collectionCount = consumption["collectionCount"] as? Int ?? 0
            self.shareCount = consumption["shareCount"] as? Int ?? 0
            self.replyCount = consumption["replyCount"] as? Int ?? 0
        }
        
        let coverDic = dict["cover"] as? NSDictionary
        if let cover = coverDic {
            self.feed  = cover["feed"] as? String ?? ""
            self.blurred = cover["blurred"] as? String ?? ""
        }
    }
}
struct EYEPopularModel {
    var videoList : [VideoModel] = [VideoModel]()
    var count : Int!
    var nextPageUrl : String!
    
    init(dict : NSDictionary) {
        self.count = dict["count"] as? Int ?? 0
        
        let videoList : NSArray = dict["videoList"] as! NSArray
        self.videoList = videoList.map({ (dict) -> VideoModel in
            return VideoModel(dict:dict as! NSDictionary)
        })
    }
}