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
    var phase = CGFloat(0.0)
    
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
        //初始化 ShapeLayer----sin
        sinLayer=CAShapeLayer()
        sinLayer?.frame=frame
        sinLayer?.frame.origin.y += frame.height
        sinLayer?.backgroundColor=UIColor.clear.cgColor
        sinLayer?.fillColor=UIColor.black.cgColor
        sinLayer?.path=creatWave(pathType: true).cgPath
        //--------------------cos
        cosLayer=CAShapeLayer()
        cosLayer?.frame=frame
        cosLayer?.frame.origin.y += frame.height
        cosLayer?.backgroundColor=UIColor.clear.cgColor
        cosLayer?.fillColor=UIColor.green.cgColor
        cosLayer?.path=creatWave(pathType: false).cgPath
        //设置图片参数----img 源，frame,显示mode
        imagv1=UIImageView(frame: bounds)
        imagv1.image=UIImage(named: "c1")
        imagv1.contentMode = .scaleAspectFill
        imagv2=UIImageView(frame: bounds)
        imagv2.image=UIImage(named: "c6")
        imagv2.contentMode = .scaleAspectFill
        imagv3=UIImageView(frame: bounds)
        imagv3.image=UIImage(named: "c5")
        imagv3.contentMode = .scaleAspectFill
        //设置图片遮罩 MASK 添加到 view
        imagv2.layer.mask=sinLayer
        imagv3.layer.mask=cosLayer
        self.addSubview(imagv1)
        self.addSubview(imagv2)
        self.addSubview(imagv3)
        //开始动画
        startW()
        var position = sinLayer?.position
        position?.y -= (frame.height);
        let animator=CABasicAnimation(keyPath: "position")
        animator.fromValue=sinLayer?.position
        animator.toValue=position
        animator.duration=7
        animator.repeatCount = MAXFLOAT
        animator.isRemovedOnCompletion=false
        sinLayer?.add(animator, forKey: "sin")
        cosLayer?.add(animator, forKey: "cos")
    }
    //MASK动画
    func startW()  {
        displayLink?.invalidate()
        displayLink=CADisplayLink.init(target: self, selector: #selector(WaveView.updateView))
        displayLink?.add(to: RunLoop.current, forMode: .commonModes)
    }
    func updateView()  {
        phase += 0.08
        sinLayer?.path=creatWave(pathType: true).cgPath
        cosLayer?.path=creatWave(pathType: false).cgPath
    }
    func creatWave(pathType:Bool) ->UIBezierPath {
        let wavePath = UIBezierPath()
        var x = 0.0
        wavePath.move(to: CGPoint(x: 0, y: frame.height+20))
        while CGFloat(x) <= frame.width {
            var y=CGFloat(0)
            let value = CGFloat(0.03*x)+phase
            if (pathType == true) {
                y = 10 * sin(value)
            } else {
                y = 10 * cos(value)
                
            }
            wavePath.addLine(to: CGPoint(x: CGFloat(x), y: y))
            x += 0.5
        }
            wavePath.addLine(to: CGPoint(x: frame.width, y: frame.height+20))
            return wavePath;
        }
}
