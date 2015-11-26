//
//  UIPageScrollView.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/19.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

protocol EditViewControllerDelegate{
    func editInfo(controller:UIPageScrollView, newInfo:String)
    func editInfoDidCancer(controller:UIPageScrollView)
}


class UIPageScrollView: UIViewController,UIScrollViewDelegate {
    //界面设计元素引用
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var scrollView: UIScrollView!
    
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate:EditViewControllerDelegate?
    
    var oldInfo:String?
    
    
    //需要显示的页面内容
    var courses = [
        ["name":"Swift","pic":"image1.jpg"],
        ["name":"ObjectC","pic":"image2.jpg"],
        ["name":"Java","pic":"image3.jpg"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if oldInfo  != nil{
            textField.text = oldInfo
        }
        
        
        
        //设置scrollView的内容总尺寸
        scrollView.contentSize = CGSizeMake(
            CGFloat(CGRectGetWidth(self.view.bounds)) * CGFloat(self.courses.count),
            CGRectGetHeight(self.view.bounds)
        )
        
        //关闭滚动条显示
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.alwaysBounceVertical =  false
        scrollView.alwaysBounceHorizontal =  true
        //协议代理，在本类中处理滚动事件
        scrollView.delegate = self
        //滚动时只能停留到某一页
        scrollView.pagingEnabled = true
        scrollView.contentSize.height = 0
        
        //添加页面到滚动面板里
        let size = scrollView.bounds.size
        for (seq,course) in courses.enumerate() {
            let page = UIView()
            let imageView=UIImageView(image:UIImage(named:course["pic"]!))
            imageView.contentMode = .ScaleAspectFit
            page.addSubview(imageView);
            page.backgroundColor = UIColor.greenColor()
            let lbl = UILabel(frame: CGRect(x: 0, y: 20, width: 100, height: 20))
            lbl.text = course["name"]
            
            page.addSubview(lbl)
            
            page.frame = CGRect(x: CGFloat(seq) * size.width, y: 0,
                width: size.width, height: size.height)
            scrollView.addSubview(page)
        }
        
        //页控件属性
        pageControl.backgroundColor = UIColor.clearColor()
        pageControl.numberOfPages = courses.count
        pageControl.currentPage = 0
        //设置页控件点击事件
        pageControl.addTarget(self, action: "pageChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UIScrollViewDelegate方法，每次滚动结束后调用
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //通过scrollView内容的偏移计算当前显示的是第几页
        let page = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        //设置pageController的当前页
        pageControl.currentPage = page
    }
    
    //点击页控件时事件处理
    func pageChanged(sender:UIPageControl) {
        //根据点击的页数，计算scrollView需要显示的偏移量
        var frame = scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        //展现当前页面内容
        scrollView.scrollRectToVisible(frame, animated:true)
    }
    
    
    @IBAction func done(sender: AnyObject) {
        delegate?.editInfo(self, newInfo: textField.text!)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        delegate?.editInfoDidCancer(self)
    }
    
    @IBAction func hidden(sender: AnyObject) {
        textField.resignFirstResponder()
    }

    
    
}
