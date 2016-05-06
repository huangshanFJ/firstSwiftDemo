//
//  EYEMainTabView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/27.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

protocol EYEMainTabViewDelegate {
    //点击前回调
    //tabbar点击时调用 定义协议规则 from:to:从某个按钮调到某个按钮
    func tabBarDidSelector(fromSelectorBytton from:Int,toSelectorButton to:Int,title:String)
}


class EYEMainTabView: UIView {

    @IBOutlet weak var ButtonOne: UIButton!
    @IBOutlet weak var ButtonTwo: UIButton!
    @IBOutlet weak var ButtonThree: UIButton!
    private weak var selectorBtn : UIButton!
    var delegate : EYEMainTabViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.bringSubviewToFront(ButtonOne)
        self.bringSubviewToFront(ButtonTwo)
        self.bringSubviewToFront(ButtonThree)
        
        setupBtnFont(tabBtn:ButtonOne)
        setupBtnFont(tabBtn: ButtonTwo)
        setupBtnFont(tabBtn: ButtonThree)
        
        selectorBtn = ButtonOne
    }
    
    class func tabView() -> EYEMainTabView {
        return NSBundle.mainBundle().loadNibNamed("EYEMainTabView", owner: nil, options: nil).last as! EYEMainTabView
    }
    
    @IBAction func buttonOneClick(sender: UIButton) {
        setSelectorbtn(sender)
    }
    @IBAction func buttonTwoClick(sender: UIButton) {
         setSelectorbtn(sender)
    }
    @IBAction func buttonThreeClick(sender: UIButton) {
         setSelectorbtn(sender)
    }
    
    /**
     设置tab字体属性
     
     - parameter btn: <#btn description#>
     */
    private func setupBtnFont(tabBtn btn : UIButton) {
        btn.titleLabel?.font = UIFont.customFont_FZLTXIHJW()
        //设置字体默认颜色
        btn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        //设置字体选中颜色
        btn.setTitleColor(UIColor.blackColor(), forState: [.Highlighted , .Selected])
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Selected)
    }
    
    /**
     *  设置选中状态
     */
    private func setSelectorbtn(selectBtn :UIButton) {
        guard selectorBtn != selectBtn else {
            return
        }
        selectorBtn.selected = false
        selectBtn.selected = true
        delegate?.tabBarDidSelector(fromSelectorBytton: selectorBtn.tag, toSelectorButton: selectBtn.tag, title: (selectBtn.titleLabel?.text)!)
        selectorBtn = selectBtn
    }
    
}
