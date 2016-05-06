//
//  EYECollectionView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/26.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

class EYECollectionLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        let itemHeight = 200*UIConstant.SCREEN_HEIGHT / UIConstant.IPHONE5_HEIGHT
        itemSize = CGSize(width: UIConstant.SCREEN_WIDTH,height: itemHeight)
        sectionInset = UIEdgeInsetsZero
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class EYECollectionView : UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout:UICollectionViewLayout) {
        super.init(frame:frame, collectionViewLayout:layout)
        backgroundColor = UIColor.whiteColor()
        
        //注册cell
        registerClass(EYEChioceCell.self,forCellWithReuseIdentifier: EYEChioceCell.reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
