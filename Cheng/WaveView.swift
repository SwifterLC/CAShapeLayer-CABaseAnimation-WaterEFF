//
//  WaveView.swift
//  Cheng
//
//  Created by 刘成 on 2017/4/15.
//  Copyright © 2017年 刘成. All rights reserved.
//

import UIKit

class WaveView: UIView {
    var displayLink:CADisplayLink?
    var sinLayer:CAShapeLayer?
    var cosLayer:CAShapeLayer?
    var imagv1: UIImageView!
    var imagv2: UIImageView!
    var imagv3: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    //setup view 成员变量初始化
    func setupView()  {
        sinLayer=CAShapeLayer()
        sinLayer?.frame=self.bounds
        //sinLayer?.frame.origin.x -= (sinLayer?.frame.width)!/2.0
        sinLayer?.backgroundColor=UIColor.clear.cgColor
        sinLayer?.fillColor=UIColor.black.cgColor
        let bezierP=UIBezierPath()
        bezierP.move(to: CGPoint(x: 0, y: 0))
        bezierP.addLine(to: CGPoint(x: self.bounds.width, y: 0))
        bezierP.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height/2))
        bezierP.addLine(to: CGPoint(x: 0, y: self.bounds.height/2))
        sinLayer?.path=bezierP.cgPath
        //设置图片2（中间图片）参数----img 源，frame,显示mode
        imagv2=UIImageView(frame: bounds)
        imagv2.image=UIImage(named: "c2")
        imagv2.contentMode = .scaleAspectFill
        //设置图片遮罩 MASK
       // imagv2.layer.mask=sinLayer
        self.addSubview(imagv2)
       // imagv1.isHidden=true
           //   imagv3.isHidden=true
      //  layer.addSublayer(sinLayer!)
      //  startW()
        print(sinLayer?.frame)
    }
    //MASK动画
    func startW()  {
        displayLink?.invalidate()
        displayLink=CADisplayLink.init(target: self, selector: #selector(WaveView.updateView))
        displayLink?.add(to: RunLoop.current, forMode: .commonModes)
    }
    func updateView()  {
        sinLayer?.frame.origin.y -= 0.5
        print("gg")
    }
}
