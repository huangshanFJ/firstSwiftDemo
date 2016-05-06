//
//  EYEDiscoverCell.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/26.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation
import UIKit

class EYEDiscoverCell: UICollectionViewCell, Reusable{
    
    //背景图片
    private var backgroundImageView : UIImageView = {
        var backgroundImageView : UIImageView = UIImageView()
        return backgroundImageView
    }()
    
    //黑色图层
    private lazy var coverbutton : UIButton = {
        var coverButton : UIButton = UIButton()
        coverButton.userInteractionEnabled = false
        coverButton.backgroundColor = UIColor.blackColor()
        coverButton.alpha = 0.3
        return coverButton
    }()
    
    //标题
    private var titleLabel : UILabel = {
        var titleLabel : UILabel = UILabel()
        titleLabel.textAlignment = .Center
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.customFont_Lobster()
        return titleLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(backgroundImageView)
        self.contentView.addSubview(coverbutton)
        self.contentView.addSubview(titleLabel)
        
        backgroundImageView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
        coverbutton.snp_makeConstraints { (make) in
            make.edges.equalTo(self.contentView)
        }
        titleLabel.snp_makeConstraints { (make) in
            make.leading.trailing.equalTo(self.contentView)
            make.height.equalTo(20)
            make.centerY.equalTo(self.contentView.center).offset(0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var model : EYEDiscoverModel! {
        didSet {
            self.backgroundImageView.yy_setImageWithURL(NSURL(string:model.bgPicture), options: .ProgressiveBlur)
            self.titleLabel.text = model.name
        }
    }
    
}
