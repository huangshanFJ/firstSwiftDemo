//
//  EYEMenuBtn.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

public enum EYEMenuBtnType {
    case None
    case Date
}

class EYEMenuBtn: UIButton {
    
    private var type : EYEMenuBtnType = .None
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.titleLabel?.font = UIFont.customFont_Lobster()
        self.setTitleColor(UIColor.blackColor(), forState: .Normal)
        self.setImage(UIImage(named: "ic_menu@3x" ), forState: .Normal)
    }
    
    convenience init(frame:CGRect, type:EYEMenuBtnType){
        self.init(frame:frame)
        
        self.type = type
        
        if type == .Date {
            self.setTitle("Today", forState: .Normal)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
        if type == .Date {
            return CGRect(x:self.height - UIConstant.UI_MARGIN_10 ,y:0,width: self.width + UIConstant.UI_MARGIN_10,height: self.height)
        }
        return CGRectZero
    }
    
    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
        return CGRect(x:0,y:0,width: self.height,height: self.height)
    }
}
