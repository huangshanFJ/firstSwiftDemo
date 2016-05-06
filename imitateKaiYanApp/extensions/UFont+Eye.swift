//
//  UFont+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/22.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

extension UIFont {
    /**
     自定义字体 -- 粗体
     */
    class func customFont_FZLTZCHJW(fontSize size : CGFloat = UIConstant.UI_FONT_12) -> UIFont {
        return UIFont(name: "FZLanTingHeiS-DB1-GB", size: size)!
    }
    
    /**
     自定义字体 - 细体
     */
    class func customFont_FZLTXIHJW(fontSize size : CGFloat = UIConstant.UI_FONT_12) -> UIFont {
        return UIFont(name: "FZLanTingHeiS-L-GB", size: size)!
    }
    
    /**
     自定义字体 - 邪邪的那种
     */
    class func customFont_Lobster (fontSize size : CGFloat = UIConstant.UI_FONT_12) -> UIFont {
        return UIFont(name: "Lobster 1.4", size: size)!
    }
}