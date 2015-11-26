//
//  UIButtonViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/16.
//  Copyright © 2015年 danggui. All rights reserved.
//


import UIKit

class UIButtonViewController: UIViewController {
    
    @IBOutlet weak var btn1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton()
        self.creatMyBtn()
    }
    
    //xib拖出来的控件
    @IBAction func btn1select(sender: AnyObject) {
        let alert = UIAlertController(title: "提示", message: "xib控件button点击", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    

    //代码创建的button
    func createButton() {
        let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(100, 100, 150, 40)
        button.setTitle("确定", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.brownColor(), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named:"12.png"), forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    func buttonPressed(button: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "You have selected this button", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func creatMyBtn(){
        // 1、使用已有类型构建按钮
//        let commonButton = UIButton(type: UIButtonType.System)
//        // 修改按钮位置及大小
//        commonButton.frame = CGRectMake(100, 100, 200, 200)
//        // 设置按钮背景图片
//        commonButton.setBackgroundImage(UIImage(named:"logo.png"), forState: UIControlState.Normal)
//        // 添加点击事件
//        commonButton.addTarget(self, action: "buttonActions:", forControlEvents: UIControlEvents.TouchUpInside)
//        // 设置按钮标签
//        commonButton.tag = 1
        // 2、自定义按钮
        let customButton = UIButton(frame: CGRectMake(self.view.frame.width/2 - 100, 400, 100, 30))
        // 设置按钮标题
        customButton.setTitle("custom", forState: UIControlState.Normal)
        // 设置按钮标题颜色
        customButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        // 设置按钮标题阴影
        customButton.setTitleShadowColor(UIColor.blackColor(), forState: UIControlState.Normal)
        // 设置按钮阴影
        customButton.titleLabel?.shadowOffset =  CGSizeMake(1.0, 1.0)
        // 设置按钮标题字体样式
        customButton.titleLabel!.font = UIFont.systemFontOfSize(18)
        // 设置按钮标题换行模式
        customButton.titleLabel!.lineBreakMode = .ByTruncatingTail
        // 设置按钮背景色
        customButton.backgroundColor = UIColor(red:0.8,green:0.8,blue:0.8,alpha:1.0)
        // 设置按钮内部内容边距
        customButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        // 去掉高亮状态下的图像颜色加深
        customButton.adjustsImageWhenHighlighted = false;
        // 去掉禁用状态下的图像颜色加深
        customButton.adjustsImageWhenDisabled = false;
        // 添加按钮按下发光效果
        customButton.showsTouchWhenHighlighted  = true;
        // 添加点击事件
        customButton.addTarget(self,action:"buttonActions:",forControlEvents:UIControlEvents.TouchUpInside)
        // 设置按钮标签
        customButton.tag = 2
        
//        self.view.addSubview(commonButton)
        self.view.addSubview(customButton)
       
    }
    
    /// 响应按钮点击事件
    func buttonActions(sender: UIButton!) {
      
        self.clearViews()
        
    }
    
    
    //清空所有子视图
    func clearViews() {
        for v in self.view.subviews as [UIView] {
            v.removeFromSuperview()
        }
    }
    
    
}


