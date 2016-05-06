//
//  UILabel+Eye.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/22.
//  Copyright © 2016年 方健. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func boundintRectWithSize(size:CGSize) -> CGSize {
        let attribute = [NSFontAttributeName : self.font]
        
        let recSize = (self.text! as NSString).boundingRectWithSize(size, options: [.UsesLineFragmentOrigin, .UsesFontLeading], attributes: attribute, context: nil).size
        return recSize;
    }
}