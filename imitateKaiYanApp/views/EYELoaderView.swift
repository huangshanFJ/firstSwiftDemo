//
//  EYELoaderView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/25.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

class EYELoaderView: UIView {
    
    private lazy var eyeBackgroundLoaderView : UIImageView = {
        let eyeBackgroundLoaderView = UIImageView(image:UIImage(named:"ic_eye_black_outer"))
        eyeBackgroundLoaderView.frame = CGRect(x : 0,y : 0,width: self.height,height:self.height)
        eyeBackgroundLoaderView.center = self.center
        eyeBackgroundLoaderView.contentMode = .ScaleAspectFill
        eyeBackgroundLoaderView.layer.allowsEdgeAntialiasing = true
        return eyeBackgroundLoaderView
    }()
    
    private lazy var eyeCneterLoaderView : UIImageView = {
        let eyeCenterLoaderView = UIImageView(image:UIImage(named:"ic_eye_black_inner"))
        eyeCenterLoaderView.frame = CGRect(x:0,y:0,width: self.height - UIConstant.UI_MARGIN_5 ,height:self.height)
        eyeCenterLoaderView.center = self.center
        eyeCenterLoaderView.contentMode = .ScaleAspectFit
        eyeCenterLoaderView.layer.allowsEdgeAntialiasing = true
        return eyeCenterLoaderView
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.addSubview(eyeBackgroundLoaderView)
        self.addSubview(eyeCneterLoaderView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startLoadingAnimation() {
        self.hidden = false
        let animation : CABasicAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionLinear)
        animation.repeatCount = HUGE
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        self.eyeCneterLoaderView.layer.addAnimation(animation, forKey: animation.keyPath)
        
    }
    
    func stopLoadingAnimation() {
        self.eyeCneterLoaderView.layer.removeAllAnimations()
    }
}
