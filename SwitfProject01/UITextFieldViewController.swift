//
//  UITextFieldViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/17.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class UITextFieldViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    var text = UITextField()
    var textview=UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        text = UITextField(frame: CGRectMake(10,80,200,30))
        //设置边框样式为圆角矩形
        text.borderStyle = UITextBorderStyle.RoundedRect
        text.placeholder="请输入用户名"
        text.adjustsFontSizeToFitWidth=true  //当文字超出文本框宽度时，自动调整文字大小
        text.minimumFontSize=14  //最小可缩小的字号
        /** 水平对齐 **/
//        textField.textAlignment = .Right //水平右对齐
//        textField.textAlignment = .Center //水平居中对齐
        text.textAlignment = .Left //水平左对齐
        
        /** 垂直对齐 **/
//        textField.contentVerticalAlignment = .Top  //垂直向上对齐
        text.contentVerticalAlignment = .Center  //垂直居中对齐
//        textField.contentVerticalAlignment = .Bottom  //垂直向下对齐
        
        text.borderStyle = .None //先要去除边框样式
        text.background=UIImage(named:"11.png");
        text.clearButtonMode=UITextFieldViewMode.WhileEditing  //编辑时出现清除按钮
//        textField.clearButtonMode=UITextFieldViewMode.UnlessEditing  //编辑时不出现，编辑后才出现清除按钮
//        textField.clearButtonMode=UITextFieldViewMode.Always  //一直显示清除按钮
        text.keyboardType = UIKeyboardType.Default
        text.becomeFirstResponder()
        text.resignFirstResponder()
        
//        textField.returnKeyType = UIReturnKeyType.Done //表示完成输入
        text.returnKeyType = UIReturnKeyType.Go //表示完成输入，同时会跳到另一页
//        textField.returnKeyType = UIReturnKeyType.Search //表示搜索
//        textField.returnKeyType = UIReturnKeyType.Join //表示注册用户或添加数据
//        textField.returnKeyType = UIReturnKeyType.Next //表示继续下一步
//        textField.returnKeyType = UIReturnKeyType.Send //表示发送
         text.delegate = self
        
        self.view.addSubview(text)
        
        
        
        
        textview=UITextView(frame:CGRectMake(10,120,200,100))
        textview.layer.borderWidth=1  //边框粗细
        textview.layer.borderColor=UIColor.grayColor().CGColor //边框颜色
        textview.editable = true //是否可编辑
        textview.selectable = true //内容是否可选
        textview.delegate = self
        //给文字中的电话号码和网址自动加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.None //都不加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.PhoneNumber //只有电话加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.Link //只有网址加链接
        textview.dataDetectorTypes = UIDataDetectorTypes.All //电话和网址都加
        
        let mail = UIMenuItem(title: "邮件", action: "onMail")
        let weixin = UIMenuItem(title: "微信", action: "onWeiXin")
        let menu = UIMenuController()
        menu.menuItems = [mail,weixin]
        
        
        self.view.addSubview(textview)
        
    }
    
    
    func onMail(){
        print("mail")
    }
    
    func onWeiXin(){
        print("weixin")
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField:UITextField) -> Bool
    {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        print(textField.text)
        return true;
    }
    
    
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {

        //收起键盘
        textView.resignFirstResponder()
        //打印出文本框中的值
        print(textView.text)
        return true;
    }
    
    @IBAction func hiddenKeyboard(sender: AnyObject) {
        text.resignFirstResponder()
        textview.resignFirstResponder()
    }
    
}
