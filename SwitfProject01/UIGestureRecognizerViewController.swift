//
//  UIGestureRecognizerViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/18.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class UIGestureRecognizerViewController: UIViewController {
     var rect:UIView!
    @IBOutlet  var dpicker:UIDatePicker!
    @IBOutlet  var btnshow:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 滑动手势
        let swipeUp = UISwipeGestureRecognizer(target:self, action:Selector("swipe:"))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target:self, action:Selector("swipe:"))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        
        //单击监听
        let tapSingle=UITapGestureRecognizer(target:self,action:"tapSingleDid")
        tapSingle.numberOfTapsRequired=1
        tapSingle.numberOfTouchesRequired=1
        //双击监听
        let tapDouble=UITapGestureRecognizer(target:self,action:"tapDoubleDid:")
        tapDouble.numberOfTapsRequired=2
        tapDouble.numberOfTouchesRequired=1
        //声明点击事件需要双击事件检测失败后才会执行
        tapSingle.requireGestureRecognizerToFail(tapDouble);
        self.view.addGestureRecognizer(tapSingle)
        self.view.addGestureRecognizer(tapDouble)
        
        //设置监听方法为pinchDid方法  捏合手势
        let pinch=UIPinchGestureRecognizer(target:self,action:"pinchDid:")
        self.view.addGestureRecognizer(pinch)
        
        
        /// 旋转手势（两个手指进行旋转）
        let rotation=UIRotationGestureRecognizer(target:self,action:"rotationDid:")
        self.view.addGestureRecognizer(rotation)
        
        
        /**
        拖拽手势
        */
        rect=UIView(frame:CGRectMake(0, 0, 100, 100))
        rect.center=self.view.center
        rect.backgroundColor=UIColor.redColor()
        self.view.addSubview(rect)
        
        let pan = UIPanGestureRecognizer(target:self,action:"panDid:")
        pan.maximumNumberOfTouches=1
        rect.addGestureRecognizer(pan)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipe(recognizer:UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.Up{
            print("向上滑动")
        }else if recognizer.direction == UISwipeGestureRecognizerDirection.Down{
            print("向下滑动")
        }
        
        let point=recognizer.locationInView(self.view)
        //这个点是滑动的起点
        print(point.x)
        print(point.y)
    }
    
    func tapSingleDid(){
        print("单击了")
    }
    
    func tapDoubleDid(sender:UITapGestureRecognizer){
        if sender.view == self.view{
            print("双击了")
        }
    }
    
    
    func pinchDid(recognizer:UIPinchGestureRecognizer)
    {
        //在监听方法中可以实时获得捏合的比例
        print(recognizer.scale);
    }
    
    
    func rotationDid(recognizer:UIRotationGestureRecognizer){
        //旋转的弧度转换为角度
        print(recognizer.rotation*(180/CGFloat(M_PI)))
    }
    
    func panDid(recognizer:UISwipeGestureRecognizer){
        let point=recognizer.locationInView(self.view)
        //设置矩形的位置
        rect.center=point
    }
    
    /**
     Swift - 日期选择控件（UIDatePicker）的用法
     */
    @IBAction func showClicked(sender:UIButton)
    {
        let date = dpicker.date
        dpicker.locale = NSLocale(localeIdentifier: "zh_CN")
        // 创建一个日期格式器
        let dformatter = NSDateFormatter()
        // 为日期格式器设置格式字符串
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        // 使用日期格式器格式化日期、时间
        let datestr = dformatter.stringFromDate(date)
        
        let message =  "您选择的日期和时间是：\(datestr)"
        
        // 创建一个UIAlertView对象（警告框），并通过该警告框显示用户选择的日期、时间
        let alertView = UIAlertView()
        alertView.title = "当前日期和时间"
        alertView.message = message
        alertView.addButtonWithTitle("确定")
        alertView.show()
    }
    

}
