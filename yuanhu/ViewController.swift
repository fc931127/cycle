//
//  ViewController.swift
//  yuanhu
//
//  Created by wyzw on 2018/4/10.
//  Copyright © 2018年 wyzw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //    画圆
    private lazy var circleProgress : FCCycleView = {
        let cycle = FCCycleView()
        cycle.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        cycle.topColor=UIColor.purple
        cycle.bottomColor=UIColor.cyan
        cycle.progressWidth=10
        return cycle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.white
        setUPUI()
        //        addLayOuts()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //        回调圆的比例 值为0-1
        if self.circleProgress.blocks != nil{
            self.circleProgress.blocks!(0.88)
        }
        
    }
    
    private func setUPUI() {
        view.addSubview(circleProgress)
    }
    
    //    private func addLayOuts() {
    //        circleProgress.snp.makeConstraints { (make) in
    //            make.top.equalTo(view.snp.top).offset(50)
    //            make.centerX.equalTo(view.snp.centerX)
    //            make.size.equalTo(CGSize(width: 200, height:200))
    //        }
    //    }
    
}

