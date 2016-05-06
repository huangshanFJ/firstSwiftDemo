//
//  EYEChoiceModel.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

struct ItemModel {
     /// 类型
    var type : String!
    
    var image : String?
    var text : String?
    
    var id : Int!
    var title : String!
    var description : String!
    var category : String!
    var duration : Int!
    var playUrl : String!
    var feed : String!
    var blurred : String!
    var subTitle : String! {
        get {
            if let _ = category,let _ = duration {
                return "#\(category!) / \(Int.durationToTimer(duration!))"
            } else {
                return ""
            }
        }
    }
    
    var collectionCount : Int!
    var shareCount : Int!
    var replyCount : Int!
    
    init(dict : NSDictionary?) {
        self.type = dict!["type"] as? String ?? ""
        let dataDict = dict!["data"] as? NSDictionary ?? dict
        if let data = dataDict {
            self.image = data["image"] as? String ?? nil
            self.text = data["text"] as? String ?? nil
            self.id = data["id"] as? Int ?? 0
            self.description = data["description"] as? String ?? ""
            self.category = data["category"] as? String ?? ""
            self.duration = data["duration"] as? Int ?? 0
            self.playUrl = data["playUrl"] as? String ?? ""
            
            //图片
            let cover = data["cover"] as? NSDictionary ?? nil
            if let coverDic = cover {
                self.feed = coverDic["feed"] as? String ?? ""
                self.blurred = coverDic["blurred"] as? String ?? ""
            }
            //评论喜欢分享数量
            let consumptionDict = data["consumption"] as? NSDictionary
            if let consumption = consumptionDict {
                self.collectionCount = consumption["collectionCount"] as? Int ?? 0
                self.shareCount = consumption["shareCount"] as? Int ?? 0
                self.replyCount = consumption["replyCount"] as? Int ?? 0
            }
            
        }
    }
}


struct IssueModel {
    var date : Int16!
    var publishTime : Int16!
    var type : String!
    var count : Int!
    var isHaveSectionView : Bool = false
    var headerTitle : String?
    var headerImage : String?
    
    var itemList : [ItemModel] = [ItemModel]()
    
    init(dict : NSDictionary) {
        self.date = dict["date"] as? Int16 ?? 0
        self.publishTime = dict["publishTime"] as? Int16 ?? 0
        self.type = dict["type"] as? String ?? ""
        self.count = dict["cound"] as? Int ?? 0
        
        let itemArray = dict["itemList"] as! [NSDictionary]
        self.itemList = itemArray.map({ (dict) -> ItemModel in
            return ItemModel(dict: dict)
        })
        
        //判断是否有headerView
        let firstItemModel = itemList.first
        if  firstItemModel?.type == "video" {
            self.isHaveSectionView = false
        } else if firstItemModel?.type == "textHeader" {
            self.isHaveSectionView = true
            self.itemList.removeFirst()
            self.headerTitle = firstItemModel?.text
        } else if firstItemModel?.type == "imageHeader" {
            self.isHaveSectionView = true
            self.itemList.removeFirst()
            self.headerImage = firstItemModel?.image
        } else {
            self.isHaveSectionView = false
        }
    }
}

struct EYEChioceModel {
    var issueList : [IssueModel] = [IssueModel]()
    //下一个page的地址
    var nextPageUrl : String!
    //下次更新的时间
    var nextPublishTime : Int16!
    var newestIssueType : String!
    
    init(dict: NSDictionary) {
        self.nextPageUrl = dict["nextPageUrl"] as? String ?? ""
        self.nextPublishTime = dict["nextPublish"] as? Int16 ?? 0
        self.newestIssueType = dict["newestIssueType"] as? String ?? ""
        
        let issueArray = dict["issueList"] as! [NSDictionary]
        self.issueList = issueArray.map({ (dict) -> IssueModel in
            return IssueModel(dict:dict)
        })
    }
}



