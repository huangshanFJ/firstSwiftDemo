//
//  Presenter.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

protocol LoadingPresenter : class {
    var loaderView : EYELoaderView! { get set }    
}

extension LoadingPresenter where Self: UIViewController {
    /**
     初始化
     */
    func setupLoaderView() {
        if loaderView == nil {
            loaderView = EYELoaderView(frame: CGRect(x:0,y:0,width:UIConstant.SCREEN_WIDTH,height:100))
            loaderView.center = CGPoint(x: UIConstant.SCREEN_WIDTH*0.5, y: UIConstant.SCREEN_HEIGHT*0.6)
            self.view.addSubview(loaderView)
        }
    }
    
    /**
     设置显示隐藏
     
     - parameter hidden: <#hidden description#>
     */
    func setLoaderViewHidden(hidden: Bool) {
        if let view = loaderView {
            view.hidden = hidden
            if hidden {
                view.stopLoadingAnimation()
            } else {
                view.startLoadingAnimation()
            }
        }
    }
    
    /**
     *  开启动画
     */
    func startLoadingAnimation() {
        if let view = loaderView {
            view.startLoadingAnimation()
        }
    }
    
    /**
     *  停止动画
     */
    func stopLoadingAnimation() {
        if let view = loaderView {
            view.stopLoadingAnimation()
        }
    }
}

protocol MenuPresenter : class {
    var menuBtn : EYEMenuBtn! { get set }
    func menuBtnDidClick()
}

extension MenuPresenter where Self:UIViewController {
    
    func setupMenuBtn (type:EYEMenuBtnType = .None) {
        menuBtn = EYEMenuBtn(frame : CGRect(x:0,y:0,width: 40,height: 40), type : type)
        menuBtn.addTarget(self,action:Selector("menuBtnDicClick"),forControlEvents:.TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:menuBtn)
    }
}

