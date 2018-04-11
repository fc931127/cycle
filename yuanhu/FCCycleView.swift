//
//  FCCycleView.swift
//  Study
//
//  Created by wyzw on 2018/4/10.
//  Copyright © 2018年 wyzw. All rights reserved.
//

import UIKit

class FCCycleView: UIView {

    var progressWidth : CGFloat = 10//线宽
    
    
    var bottomColor : UIColor? //底线
    
    var topColor : UIColor?//progress线条
    
    
    
    var origin : CGPoint = CGPoint(x: 0, y: 0)//圆点
    var radius : CGFloat = 0//半径
    var startAngle : CGFloat = 0//起始
    var endAngle : CGFloat = 0//结束
    
    var blocks : ((_ progressfloat: CGFloat)->())?
    
    
    //进度label
    private lazy var progressLabel : UILabel = {
        let lab = UILabel()
        lab.frame = CGRect(x: 0, y: 0, width: 100, height: 15)
        lab.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        lab.textColor = UIColor.red
        lab.font=UIFont.systemFont(ofSize: 13)
        lab.textAlignment = .center
        return lab
    }()
    private lazy var bottomLayer : CAShapeLayer = {
        let layers = CAShapeLayer()
        layers.fillColor=UIColor.clear.cgColor
        return layers
    }()
    private lazy var topLayer : CAShapeLayer = {
        let layers = CAShapeLayer()
        layers.lineCap=kCALineCapRound
        layers.fillColor=UIColor.clear.cgColor
        return layers
    }()
    
    
    
    override func draw(_ rect: CGRect) {

        setUPUI()
        addRound()
        setMethoud()

        blocks = {(profloat: CGFloat)->() in
            self.progressLabel.text = "\(Int(profloat * 100))" + "%"
            self.startAngle = -CGFloat(Double.pi/2)
            self.endAngle = self.startAngle + profloat * CGFloat(Double.pi * 2)
            let topPath  = UIBezierPath.init(arcCenter: self.origin, radius: self.radius, startAngle: self.startAngle, endAngle: self.endAngle, clockwise: true)
            self.topLayer.path=topPath.cgPath//添加路径
            //添加动画
            let pathAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
            pathAnimation.duration = 1//动画持续时间
            pathAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseOut)
            pathAnimation.fromValue = 0
            pathAnimation.toValue = 1
            self.topLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.white
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUPUI() {
        
        layer.addSublayer(bottomLayer)
        layer.addSublayer(topLayer)
        addSubview(progressLabel)
    }
    func addRound() {
        origin = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
        radius = self.bounds.size.width/2
        let bottomPath  = UIBezierPath.init(arcCenter: origin, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        bottomLayer.path=bottomPath.cgPath
    }
    func setMethoud()  {
        bottomLayer.strokeColor = bottomColor?.cgColor
        topLayer.strokeColor = topColor?.cgColor
        topLayer.lineWidth = progressWidth
        bottomLayer.lineWidth=progressWidth
    }
    
    
    
    
}


