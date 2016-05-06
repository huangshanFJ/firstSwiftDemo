//
//  EYECollectionLayout.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/26.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

class EYEDiscoverFlowLayout : UICollectionViewFlowLayout {
    private var contentHeight : CGFloat = 0
    //获取collectionView高度
    private var width : CGFloat {
        get {
            let insets = collectionView!.contentInset
            return CGRectGetWidth(collectionView!.bounds) - (insets.left + insets.right)
        }
    }
    
    private var numberOfSection : Int! {
        return collectionView?.numberOfSections() ?? 0
    }
    
    //滚动区域
    override func collectionViewContentSize() -> CGSize {
        return CGSize(width: width,height: contentHeight)
    }
    
    override func prepareLayout() {
        super.prepareLayout()
    }
}