//
//  EYEMenuHeaderView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/27.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit
import SnapKit

class EYEMenuHeaderView: UIView {

    //头像
    private lazy var backgroundIconView : UIView = {
        var backgroundIconView : UIView = UIView()
        backgroundIconView.backgroundColor = UIColor.lightGrayColor()
        backgroundIconView.layer.borderColor = UIColor.whiteColor().CGColor
        backgroundIconView.layer.borderWidth = 2
        return backgroundIconView
    }()
    
    //眼睛
    private lazy var eyeIconView : UIView = {
        var eyeIconView : UIView = UIView()
        eyeIconView.contentMode = .ScaleAspectFit
        return eyeIconView
    }()
    
    //登陆标签
    private lazy var loginLabel : UILabel = {
        var loginLabel : UILabel = UILabel()
        loginLabel.text = "点击登陆后评论"
        loginLabel.textAlignment = .Center
        loginLabel.textColor = UIColor.blackColor()
        loginLabel.font = UIFont.customFont_FZLTXIHJW(fontSize: UIConstant.UI_FONT_14)
        return loginLabel
    }()
    
    //分割线
    private lazy var lineView : UIView = {
        var lineView : UIView = UIView()
        lineView.backgroundColor = UIColor.lightGrayColor()
        return lineView
    }()
    
    //我的收藏
    private lazy var collectionLabel : UILabel = {
        var collectionLabel : UILabel = UILabel()
        collectionLabel.textAlignment = .Center
        collectionLabel.text = "我的收藏"
        collectionLabel.font = UIFont.customFont_FZLTXIHJW()
        collectionLabel.textColor = UIColor.blackColor()
        return collectionLabel
    }()
    
    //我的评论
    private lazy var commitLabel : UILabel = {
        var commitLabel : UILabel = UILabel()
        commitLabel.textAlignment = .Center
        commitLabel.text = "我的评论"
        commitLabel.font = UIFont.customFont_FZLTXIHJW(fontSize: UIConstant.UI_FONT_13)
        commitLabel.textColor = UIColor.blackColor()
        return commitLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        //添加控件
        self.addSubview(backgroundIconView)
        backgroundIconView.addSubview(eyeIconView)
        self.addSubview(loginLabel)
        self.addSubview(lineView)
        self.addSubview(collectionLabel)
        self.addSubview(commitLabel)
        
        //适配
        backgroundIconView.snp_makeConstraints { [unowned self](make) in
            make.size.equalTo(CGSize(width: 100,height: 100))
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(UIConstant.UI_MARGIN_10)
        }
        backgroundIconView.layer.cornerRadius = 50
        
        eyeIconView.snp_makeConstraints { [unowned self](make) in
            make.left.right.equalTo(self)
            make.top.equalTo(self.backgroundIconView.snp_bottom).offset(UIConstant.UI_MARGIN_10)
            make.height.equalTo(20)
        }
        
        lineView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(self.loginLabel.snp_bottom).offset(UIConstant.UI_MARGIN_10)
            make.width.equalTo(1)
            make.height.equalTo(20)
        }
        
        collectionLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self).offset(UIConstant.UI_MARGIN_10)
            make.right.equalTo(self.lineView)
            make.top.equalTo(self.loginLabel.snp_bottom).offset(UIConstant.UI_MARGIN_10)
            make.height.equalTo(20)
        }
        
        commitLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.lineView)
            make.right.equalTo(self).offset(-UIConstant.UI_MARGIN_20)
            make.top.equalTo(collectionLabel.snp_bottom)
            make.height.equalTo(collectionLabel.snp_height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
