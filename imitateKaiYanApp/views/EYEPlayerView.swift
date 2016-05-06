//
//  EYEPlayerView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/27.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

class EYEPlayerView: UIView {
     /// 顶部阴影
    @IBOutlet weak var topCoverView: UIView!
     /// 底部阴影
    @IBOutlet weak var bottomCoverView: UIView!
     /// 返回按钮
    @IBOutlet weak var backBtn: UIButton!
     /// 影片名
    @IBOutlet weak var titleLabel: UILabel!
     /// 开始anniu
    @IBOutlet weak var startBtn: UIButton!
     /// 开始时间
    @IBOutlet weak var startTime: UILabel!
     /// 结束时间
    @IBOutlet weak var endTime: UILabel!
     /// 缓存进度
    @IBOutlet weak var progressView: UIProgressView!
     /// 播放进度
    @IBOutlet weak var sliderView: UISlider!
     /// 菊花
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
     /// 快进、后退
    @IBOutlet weak var horizontalLabel: UILabel!
     /// 顶部view
    @IBOutlet weak var topView: UIView!
     /// 底部view
    @IBOutlet weak var bottomView: UIView!
    
    //是否显示覆盖层
    private var isShowCoverView : Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //设置进度条属性
        self.sliderView.setThumbImage(UIImage(named: "slider"), forState: .Normal)
        self.insertSubview(self.progressView, belowSubview: self.sliderView)
        self.sliderView.minimumTrackTintColor = UIColor.whiteColor()
        self.sliderView.maximumTrackTintColor = UIColor(colorLiteralRed: 0.3, green: 0.3, blue: 0.3, alpha: 0.6)
        
        //设置缓存进度条属性
        self.progressView.progressTintColor = UIColor.whiteColor()
        self.progressView.trackTintColor = UIColor.clearColor()
        
        //设置快进快退label
        horizontalLabel.backgroundColor = UIColor(patternImage:UIImage(named: "Management_Mask")!)
        indicatorView.stopAnimating()
        horizontalLabel.hidden = true
        
        //点击屏幕
        let tap = UITapGestureRecognizer(target: self,action: #selector(EYEPlayerView.tapAction))
        self.addGestureRecognizer(tap)
        
    }
    
    class func playerView() -> EYEPlayerView {
        return NSBundle.mainBundle().loadNibNamed("EYEPlayerView", owner: nil, options: nil).last as! EYEPlayerView
    }
    
    /**
     隐藏底部view和顶部view动画
     */
    @objc private func hiddenAnimation() {
         isShowCoverView = false
        
       UIView.animateWithDuration(0.2, animations: { 
        self.topView.transform = CGAffineTransformMakeTranslation(0, -50)
        self.topCoverView.transform = CGAffineTransformMakeTranslation(0, -50)
        self.bottomView.transform = CGAffineTransformMakeTranslation(0, 50)
        self.bottomCoverView.transform = CGAffineTransformMakeTranslation(0, 50)
        }) { (_) in
            self.topView.hidden = true
            self.topCoverView.hidden = true
            self.bottomCoverView.hidden = true
            self.bottomView.hidden = true
        }
    }
    
    private func showAnimation() {
        isShowCoverView = true
        
        self.topCoverView.hidden = false
        self.topCoverView.hidden = false
        
        self.bottomView.hidden = false
        self.bottomCoverView.hidden = false
        
        UIView.animateWithDuration(0.2, animations: { 
            self.topView.transform = CGAffineTransformIdentity
            self.topCoverView.transform = CGAffineTransformIdentity
            
            self.bottomView.transform = CGAffineTransformIdentity
            self.bottomCoverView.transform = CGAffineTransformIdentity
            }) { (_) in
                self.afterHidden()
        }
    }
    
    /**
     延迟隐藏底部view和顶部View
     */
    private func afterHidden() {
        NSObject.cancelPreviousPerformRequestsWithTarget(self,selector: #selector(EYEPlayerView.hiddenAnimation),object: nil)
        
        self.performSelector(#selector(EYEPlayerView.hiddenAnimation),withObject: nil,afterDelay: 5.0)
    }
    
    
    @objc private func tapAction() {
        if isShowCoverView {
            self.hiddenAnimation()
        } else {
            self.showAnimation()
        }
    }
}
