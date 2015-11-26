//
//  OtherWidget2.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/18.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class OtherWidget2: UIViewController,UIActionSheetDelegate {
    let swiftColor = UIColor(red: 1, green: 175/255, blue: 175/255, alpha: 1)
    
    var stepper:UIStepper!
    var lab:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = swiftColor

        
        
        /**
        Swift - 滑块（UISlider）的用法
        */
        let slider=UISlider(frame:CGRectMake(0,0,300,50))
        slider.center=self.view.center
        slider.minimumValue=0  //最小值
        slider.maximumValue=1  //最大值
        slider.value=0.5  //当前默认值
        slider.minimumTrackTintColor=UIColor.redColor()  //左边槽的颜色
        slider.maximumTrackTintColor=UIColor.greenColor() //右边槽的颜色
        
//        slider.minimumValueImage=UIImage(named:"voice+")  //左边图标
//        slider.maximumValueImage=UIImage(named:"voice-")  //右边图标
//        
        slider.continuous=false  //滑块滑动停止后才触发ValueChanged事件
        slider.addTarget(self,action:"sliderDidchange:", forControlEvents:UIControlEvents.ValueChanged)
//
//        //设置滑块右边部分的图片
//        slider.setMaximumTrackImage(UIImage(named:"slider_max"),forState:UIControlState.Normal)
//        //设置滑块左边部分的图片
//        slider.setMinimumTrackImage(UIImage(named:"slider_min"),forState:UIControlState.Normal)
//        //设置滑块的图片
//        slider.setThumbImage(UIImage(named:"slider_thumb"),forState:UIControlState.Normal)
//
//        //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
//        let imgTrackRight = UIImage(named:"slider_max")
//        let imgRight = imgTrackRight!.stretchableImageWithLeftCapWidth(14, topCapHeight:0)
//        slider.setMaximumTrackImage(imgRight, forState:UIControlState.Normal)
        
        
        self.view.addSubview(slider)
        
        
        /**
        Swift - 告警框（UIAlertView）的用法
        */
        
        let alertView = UIAlertView()
        alertView.title = "系统提示"
        alertView.message = "您确定要离开hangge.com吗？"
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("确定")
        alertView.cancelButtonIndex=0
        alertView.delegate=self;
        alertView.alertViewStyle = UIAlertViewStyle.LoginAndPasswordInput
        
        alertView.show()
        
//        Default：默认样式
//        PlainTextInput：带输入框的告警框
//        SecureTextInput：带密码框的告警框
//        LoginAndPasswordInput：带输入框和密码框的告警框
        
        /**
        Swift - 操作表（UIActionSheel）的用法，也叫底部警告框
        */
        
        let actionSheet=UIActionSheet()
        //actionSheet.title = "请选择操作"
        actionSheet.addButtonWithTitle("取消")
        actionSheet.addButtonWithTitle("动作1")
        actionSheet.addButtonWithTitle("动作2")
        actionSheet.cancelButtonIndex=0
        actionSheet.delegate=self
        actionSheet.showInView(self.view);
        
//        actionSheet.showInView(self.view);  //一般情况
//        actionSheet.showFromToolbar(self.navigationController.toolbar)  //工具条的情况下
//        actionSheet.showFromTabBar(self.tabBar)  //标签条的情况下
        
        
        /**
        Swift - 微调器或叫步进器（UIStepper）的用法
        */
        stepper=UIStepper()
        stepper.center=CGPoint(x: 100,y: 100)
        //设置stepper的范围与初始值
        stepper.maximumValue=10
        stepper.minimumValue=1
        stepper.value=5.5
        //设置每次增减的值
        stepper.stepValue=0.5
        //设置stepper可以按住不放来连续更改值
        stepper.continuous=true
        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        stepper.wraps=true
        stepper.addTarget(self,action:"stepperValueIschanged",
            forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(stepper)
        lab=UILabel(frame:CGRectMake(100,190,300,30))
        print(stepper.value)
        lab.text = "当前值为：\(stepper.value)"
        self.view.addSubview(lab)
        
//        //用自定义的图片替换“-”和“+”
//        stepper.setDecrementImage(UIImage(named: "sub.png"), forState: UIControlState.Normal)
//        stepper.setIncrementImage(UIImage(named: "add.png"), forState: UIControlState.Normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sliderDidchange(slider:UISlider){
        print(slider.value)
    }
    
    func alertView(alertView:UIAlertView, clickedButtonAtIndex buttonIndex: Int){
        if(buttonIndex==alertView.cancelButtonIndex){
            print("点击了取消")
        }
        else
        {
            print("点击了确认")
            let name = alertView.textFieldAtIndex(0)
            let password = alertView.textFieldAtIndex(1)
            print("用户名是：\(name!.text) 密码是：\(password!.text)")
            
        }
    }
    
    func actionSheet(actionSheet: UIActionSheet, didDismissWithButtonIndex buttonIndex: Int) {
        print("点击了："+actionSheet.buttonTitleAtIndex(buttonIndex)!)
    }
    
    
    func stepperValueIschanged(){
        lab.text="当前值为：\(stepper.value)"
    }
    
    
}