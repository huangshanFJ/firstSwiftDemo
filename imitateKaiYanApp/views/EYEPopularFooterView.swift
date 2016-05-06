//
//  EYEPopularFooterView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/28.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

class EYEPopularFooterView: UICollectionReusableView, Reusable {

    private lazy var titleLabel : UILabel = {
        var titleLabel = UILabel()
        titleLabel.text = "-The End-"
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.customFont_Lobster(fontSize: UIConstant.UI_FONT_12)
        return titleLabel
    }()
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { [unowned self](make) in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   

}
