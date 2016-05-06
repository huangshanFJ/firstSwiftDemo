//
//  EYEChioceCell.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit
import SnapKit
import YYWebImage

class EYEChioceCell: UICollectionViewCell, Reusable {
        /// 背景图
    lazy var backgroundImageView : UIImageView = {
        var background : UIImageView = UIImageView()
        return background
    }()
    
        /// 黑色图层
    lazy var coverButton : UIButton = {
        var coverButton : UIButton = UIButton()
        coverButton.userInteractionEnabled = true
        coverButton.backgroundColor = UIColor.blackColor()
        coverButton.alpha = 0.3
        return coverButton
    }()
    
        /// 标题
    lazy var titleLabel : UILabel = {
        var titleLabel : UILabel = UILabel()
        titleLabel.textAlignment = .Center
        titleLabel.text = "hello"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.customFont_FZLTZCHJW(fontSize: UIConstant.UI_FONT_13)
        return titleLabel
    }()
    
        /// 副标题
    lazy var subTitleLabel : UILabel = {
        var subTitleLabel : UILabel = UILabel()
        subTitleLabel.textAlignment = .Center
        subTitleLabel.text = "副标题"
        subTitleLabel.textColor = UIColor.blueColor()
        subTitleLabel.font = UIFont.customFont_Lobster()
        return subTitleLabel
    }()
    
        /// 下面横线
    private lazy var bottomLime : UIView = {
        var bottomLime = UIView()
        bottomLime.backgroundColor = UIColor.whiteColor()
        return bottomLime
    }()
    
        /// 上面横线
    private lazy var topLine : UIView = {
        var topLine = UIView()
        topLine.backgroundColor = UIColor.whiteColor()
        return topLine
    }()
    
        /// 行数
    private lazy var indexLabel : UILabel = {
        var indexLabel = UILabel()
        indexLabel.textColor = UIColor.whiteColor()
        indexLabel.textAlignment = .Center
        indexLabel.font = UIFont.customFont_FZLTXIHJW()
        return indexLabel
    }()
    
    private lazy var indexView : UIView = {
        var indexView : UIView = UIView()
        indexView.hidden = true
        indexView.backgroundColor = UIColor.whiteColor()
        indexView.addSubview(self.indexLabel)
        indexView.addSubview(self.topLine)
        indexView.addSubview(self.bottomLime)
        return indexView
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(backgroundImageView)
        self.contentView.addSubview(coverButton)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(subTitleLabel)
        self.contentView.addSubview(indexView)
        
        backgroundImageView.snp_makeConstraints{ [unowned self](make) -> Void in
            make.leading.trailing.top.bottom.equalTo(self.contentView)
        }
        coverButton.snp_makeConstraints { [unowned self](make) -> Void in
            make.leading.trailing.top.bottom.equalTo(self.contentView)
        }
        titleLabel.snp_makeConstraints { [unowned self](make) -> Void in
            make.leading.trailing.equalTo(self.contentView)
            make.height.equalTo(20)
            make.centerY.equalTo(self.contentView.center).offset(-10)
        }
        subTitleLabel.snp_makeConstraints { [unowned self](make) -> Void in
            make.leading.trailing.equalTo(self.contentView)
            make.height.equalTo(20)
        }
        indexView.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.contentView)
            make.bottom.equalTo(self.contentView).offset(-30)
            make.height.equalTo(30)
        }
        indexLabel.snp_makeConstraints { (make) in
            make.edges.equalTo(self.indexView)
        }
        topLine.snp_makeConstraints { (make) in
            make.top.equalTo(self.indexView)
            make.height.equalTo(0.5)
            make.width.equalTo(30)
            make.centerX.equalTo(self.indexView.center)
        }
        bottomLime.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.indexView)
            make.leading.trailing.equalTo(topLine)
            make.size.equalTo(topLine)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.backgroundImageView.image = nil
    }
    
    //传入模型设置数据
    var model : ItemModel! {
        didSet {
            if let feed = model.feed {
                self.backgroundImageView.yy_setImageWithURL(NSURL(string :feed), options: .ProgressiveBlur)
            } else {
                if let image = model.image {
                    self.backgroundImageView.yy_setImageWithURL(NSURL(string:image)!, options: .ProgressiveBlur)
                    self.subTitleLabel.hidden = true
                }
            }
            
            //设置标题
            self.titleLabel.text = model.title
            //设置子标题
            self.subTitleLabel.text = model.subTitle
        }
    }
    
    //传入index
    var index : String! {
        didSet {
            self.indexView.hidden = false
            self.indexLabel.text = index
        }
    }
}
