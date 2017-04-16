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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wave=WaveView(frame: CGRect(x: 0, y: 0, width: 136, height: 136))
        wave.center=view.center
        view.backgroundColor=UIColor.white
        view.addSubview(wave)
        //startLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // setup CADisplayLink
//    func startLoad()  {
//    }
    }

