//
//  UIWebViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/18.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class UIWebViewController: UIViewController {
    
    @IBOutlet var webview:UIWebView!
    @IBOutlet var loadtype:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //默认选中分段控件的第一项
        loadtype.selectedSegmentIndex = 0
        typeChanged(loadtype)
    }
    
    @IBAction func typeChanged(sender:UISegmentedControl)
    {
        let index = sender.selectedSegmentIndex
        print(index)
        switch index
        {
        case 0: //在 UIWebView 中显示 HTML 内容
            let html = "<h1>欢迎来到：<a href='http://hangge.com'>航歌</a></h1>";
            webview.loadHTMLString(html,baseURL:nil)
        case 1: //在 UIWebView 中显示 PDF
            let path = NSBundle.mainBundle().pathForResource("test1", ofType:"pdf")
            
            let urlStr = NSURL.fileURLWithPath(path!);
            print(urlStr)
            webview.loadRequest(NSURLRequest(URL:urlStr));
        case 2: //在 UIWebView 中显示 PDF, 但是是通过 loadData 方式加载
            let path = NSBundle.mainBundle().pathForResource("test1", ofType:"pdf")
            
            let urlStr = NSURL.fileURLWithPath(path!);
            let data = NSData(contentsOfURL:urlStr);
            
            webview.loadData(data!,  MIMEType:"application/pdf",
                textEncodingName:"utf-8",baseURL:NSURL());
        default:
            print("是不是出错了？")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}