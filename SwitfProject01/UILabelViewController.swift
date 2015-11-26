//
//  UILabelViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/17.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class UILabelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()
        //设置标签x坐标：10，y坐标：20，长：300，宽：100
        let label=UILabel(frame:CGRectMake(10,200, 300, 100))
//        label.text="hangge.comhangge.comhangge.comhangge.comhangge.comhangge.comhangge.comhangge.comhangge.comhangge.com"
        label.textColor=UIColor.whiteColor()  //白色文字
        label.backgroundColor=UIColor.blackColor() //黑色背景
        label.textAlignment=NSTextAlignment.Center //文字居中对齐
        label.shadowColor=UIColor.grayColor()  //灰色阴影
        label.shadowOffset=CGSizeMake(-5,5)  //阴影的偏移量
        label.font = UIFont(name:"Arial", size:20)
        label.lineBreakMode=NSLineBreakMode.ByTruncatingTail  //隐藏尾部并显示省略号
//        label.lineBreakMode=NSLineBreakMode.ByTruncatingMiddle  //隐藏中间部分并显示省略号
//        label.lineBreakMode=NSLineBreakMode.ByTruncatingHead  //隐藏头部并显示省略号
//        label.lineBreakMode=NSLineBreakMode.ByClipping  //截去多余部分也不显示省略号
        
        label.adjustsFontSizeToFitWidth=true //当文字超出标签宽度时，自动调整文字大小，使其不被截断
        label.numberOfLines=2  //显示两行文字（默认只显示一行，设为0表示没有行数限制）
        label.highlighted = true //设置文本高亮
        label.highlightedTextColor = UIColor.greenColor() //设置文本高亮颜色
        
        
        //富文本设置
        let attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!,
            range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(),
            range: NSMakeRange(0, 3))
        //设置文字背景颜色
//        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(),
//            range: NSMakeRange(3,3))
        label.attributedText = attributeString
        
        
        
        self.view.addSubview(label);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
