//
//  ViewController.swift
//  Cheng
//
//  Created by 刘成 on 2017/4/15.
//  Copyright © 2017年 刘成. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var wave:WaveView!
    let maskLayer = CALayer()
    let imageView = UIImageView(image: UIImage(named: "backgroud"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wave=WaveView(frame: CGRect(x: 0, y: 0, width: 136, height: 136))
        wave.center=view.center
        view.backgroundColor=UIColor.white
        view.addSubview(wave)
        //startLoad()
        
//        //alpha=1 表示不透明 alpha ＝ 0 表示全透明
//        self.view.backgroundColor = UIColor.white
//        self.view.addSubview(imageView)
//        imageView.frame.size = CGSize(width: 200, height: 200)
//        imageView.center=self.view.center
//        maskLayer.frame = CGRect(x: 0, y: 0, width: imageView.frame.size.width/2, height:imageView.frame.size.height)
//        maskLayer.backgroundColor=UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 0.4).cgColor
//        imageView.layer.mask = maskLayer

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // setup CADisplayLink
//    func startLoad()  {
//    }
    }

