//
//  EYEShapeView.swift
//  imitateKaiYanApp
//
//  Created by 方健 on 16/4/28.
//  Copyright © 2016年 方健. All rights reserved.
//

import UIKit

class EYEShapeView: UIView {

    var pathLayer: CAShapeLayer!
    
    //做动画的字体
    var animationString : String! {
        didSet {
            let pathLayer = setupDefaultLayer()
            self.pathLayer = pathLayer
        }
    }
    
    //字体
    var font : UIFont!
    //字体大小
    var fontSize : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        font = UIFont.customFont_Lobster()
        fontSize = UIConstant.UI_FONT_12
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupDefaultLayer() -> CAShapeLayer {
        
        //创建字体
        let letters = CGPathCreateMutable()
        let font = CTFontCreateWithName("HelveticaNeue-UltraLight", self.fontSize, nil)
        let attrString = NSAttributedString(string: animationString, attributes: [kCTFontAttributeName as String: font])
       
        let line = CTLineCreateWithAttributedString(attrString)
        let runArray = CTLineGetGlyphRuns(line)
        for runIndex in 0..<CFArrayGetCount(runArray) {
            let run = unsafeBitCast(CFArrayGetValueAtIndex(runArray, runIndex), CTRunRef.self)
            let runFont = unsafeBitCast(CFDictionaryGetValue(CTRunGetAttributes(run), unsafeBitCast(kCTFontAttributeName, UnsafePointer<Void>.self)), CTFontRef.self)
            
            for runGlyphIndex in 0..<CTRunGetGlyphCount(run) {
                let thisGlyphRange = CFRangeMake(runGlyphIndex, 1)
                var glyph : CGGlyph = CGGlyph()
                var position : CGPoint = CGPoint()
                CTRunGetGlyphs(run, thisGlyphRange, &glyph)
                CTRunGetPositions(run, thisGlyphRange, &position)
                
                let letter = CTFontCreatePathForGlyph(runFont, glyph, nil)
                var t = CGAffineTransformMakeScale(position.x, position.y)
                CGPathAddPath(letters, &t, letter);
            }
        }
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointZero)
        path.appendPath(UIBezierPath(CGPath: letters))
        
        let pathLayer = CAShapeLayer()
        pathLayer.frame = self.bounds
        pathLayer.bounds = CGPathGetBoundingBox(path.CGPath)
        pathLayer.geometryFlipped = true
        pathLayer.path = path.CGPath
        pathLayer.strokeColor = UIColor.whiteColor().CGColor
        pathLayer.fillColor = nil
        pathLayer.strokeEnd = 1
        pathLayer.lineWidth = 1.0
        pathLayer.lineJoin = kCALineJoinBevel
        return pathLayer
    }
    
    /**
     动画
     */
    func startAnimation() {
        self.layer.addSublayer(pathLayer)
        
        let animation = CABasicAnimation(keyPath:"strokeEnd")
        animation.delegate = self
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 0.5
        animation.removedOnCompletion = false
        self.pathLayer.addAnimation(animation, forKey: animation.keyPath)
    }
    
    /**
     *  停止动画
     */
    func stopAnimation() {
        self.pathLayer.removeAllAnimations()
    }

}
