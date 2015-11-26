//
//  CoreMotionViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/18.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController ,UIAccelerometerDelegate{
    
    var ball:UIImageView!
    var speedX:UIAccelerationValue=0
    var speedY:UIAccelerationValue=0
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //放一个小球在中央
        ball=UIImageView(image:UIImage(named:"image4.png"))
        ball.frame=CGRectMake(0,0,50,50)
        ball.center=self.view.center
        self.view.addSubview(ball)
        
        motionManager.accelerometerUpdateInterval = 1/60
        
        
        if(motionManager.accelerometerAvailable)
        {
            let queue = NSOperationQueue.currentQueue()
            motionManager.startAccelerometerUpdatesToQueue(queue!, withHandler:
                { (accelerometerData : CMAccelerometerData?, error: NSError?) -> Void in
                    
                    //动态设置小球位置
                    self.speedX += accelerometerData!.acceleration.x
                    self.speedY +=  accelerometerData!.acceleration.y
                    var posX=self.ball.center.x + CGFloat(self.speedX)
                    var posY=self.ball.center.y - CGFloat(self.speedY)
                    //碰到边框后的反弹处理
                    if posX<0 {
                        posX=0;
                        //碰到左边的边框后以0.4倍的速度反弹
                        self.speedX *= -0.4
                        
                    }else if posX > self.view.bounds.size.width {
                        posX=self.view.bounds.size.width
                        //碰到右边的边框后以0.4倍的速度反弹
                        self.speedX *= -0.4
                    }
                    if posY<0 {
                        posY=0
                        //碰到上面的边框不反弹
                        self.speedY=0
                    } else if posY>self.view.bounds.size.height{
                        posY=self.view.bounds.size.height
                        //碰到下面的边框以1.5倍的速度反弹
                        self.speedY *= -1.5
                    }
                    self.ball.center=CGPointMake(posX,posY)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
