//
//  UIScrollViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/18.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class UIScrollViewController: UIViewController,UIScrollViewDelegate{
    
    var scrollView:UIScrollView!
    
    let numOfPages:Int = 3
    let pageWidth:CGFloat  = UIScreen.mainScreen().bounds.width
    let pageHeight:CGFloat = UIScreen.mainScreen().bounds.height-80
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

/// Swift - 滚动视图（UIScrollView）的用法
        
//        scrollView = UIScrollView()
//        //设置代理
//        scrollView.minimumZoomScale=0.1 //最小比例
//        scrollView.maximumZoomScale=3 //最大比例
//        scrollView.delegate = self
//        scrollView.frame=self.view.bounds
//        let imageView=UIImageView(image:UIImage(named:"ii.jpg"))
//        scrollView.contentSize=imageView.bounds.size;
//        scrollView.addSubview(imageView);
//        self.view.addSubview(scrollView)
        

 /// Swift - 使用UIScrollView实现页面滚动切换
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        //为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize=CGSizeMake(CGFloat(pageWidth * CGFloat(numOfPages)), CGFloat(pageHeight))
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        //添加子页面
        for i in 0...numOfPages{
            let myViewController = MyViewController(number:(i+1))
            myViewController.view.frame = CGRectMake(CGFloat(pageWidth * CGFloat(i)),
                CGFloat(0), CGFloat(pageWidth), CGFloat(pageHeight))
            scrollView.addSubview(myViewController.view)
        }
        self.view.addSubview(scrollView)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //视图滚动中一直触发
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        for subview : AnyObject in scrollView.subviews {
            if subview.isKindOfClass(UIImageView) {
                return subview as? UIView
            }
        }
        return nil
    }
    
}

