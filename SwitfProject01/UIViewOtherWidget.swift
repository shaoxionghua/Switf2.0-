//
//  UIViewOtherWidget.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/17.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class UIViewOtherWidget: UIViewController {
    let swiftColor = UIColor(red: 1, green: 165/255, blue: 0, alpha: 1)
    var uiswitch:UISwitch!;
    var imageViewAnn:UIImageView!
    let progressView=UIProgressView(progressViewStyle:UIProgressViewStyle.Default)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = swiftColor
        
        /**
        *  UISwitch 开关控件
        *
        *  @param 180
        *  @param 150
        *
        *  @return
        */
        uiswitch = UISwitch()
        //设置位置（开关大小无法设置）
        uiswitch.center=CGPointMake(180,100);
        //设置默认值
        uiswitch.on = true;
        uiswitch.addTarget(self, action: Selector("switchDidChange"),
            forControlEvents:UIControlEvents.ValueChanged)
        self.view.addSubview(uiswitch);
//************************************************************************************************************************************//
        
        /**
        *  UISegmentedControl 分段选择器
        *
        *  @param 180
        *  @param 150
        *
        *  @return
        */
        //选项除了文字还可以是图片
        let items=["选项一","选项二"] as [AnyObject]
        let segmented=UISegmentedControl(items:items)
        segmented.center=self.view.center
        segmented.selectedSegmentIndex=1 //默认选中第二项
        segmented.addTarget(self, action: "segmentDidchange:",
            forControlEvents: UIControlEvents.ValueChanged)  //添加值改变监听
        
        segmented.tintColor=UIColor.redColor() //修改选项颜色（包括图片选项）
        segmented.setTitle("swfit",forSegmentAtIndex:1) //修改选项文字
//        segmented.setContentOffset(CGSizeMake(10,7),forSegmentAtIndex:1)//修改选项内容偏移位置
//        self.view.addSubview(segmented)
//************************************************************************************************************************************//
        
        
        /**
        *  UIImageView 图像控件（UIImageView）的用法
        *
        *  @param 180
        *  @param 150
        *
        *  @return
        */
        
        
        let imageView=UIImageView(image:UIImage(named:"image5.jpg"))
        imageView.frame=CGRectMake(0,150,180,180)
//        self.view.addSubview(imageView)
        
//        let path = NSBundle.mainBundle().pathForResource("image4", ofType: "jpg")
//        let newImage = UIImage(contentsOfFile: path!)
//        imageView.image = newImage
//        self.view.addSubview(imageView)
        
        
        //定义NSURL对象
        let url = NSURL(string: "http://upload.chinaz.com/2015/1010/1444461402354.jpg")
        //从网络获取数据流
        let data = NSData(contentsOfURL: url!)
        //通过数据流初始化图片
        let newImage = UIImage(data: data!)
        imageView.image = newImage
        imageView.contentMode = .ScaleAspectFit
        self.view.addSubview(imageView)
        
        
        //使用图像控件实现动画播放
        imageViewAnn=UIImageView()
        imageViewAnn.frame=CGRectMake(320-100,150,180,180)
        //设置动画图片
        imageViewAnn.animationImages=[UIImage(named:"image1.jpg")!,UIImage(named:"image2.jpg")!,UIImage(named:"image3.jpg")!,UIImage(named:"image4.png")!,UIImage(named:"image5.jpg")!]
        //设置每隔0.5秒变化一次
        imageViewAnn.animationDuration=1.0
        imageViewAnn.contentMode = .ScaleAspectFit
        self.view.addSubview(imageViewAnn)
        
//************************************************************************************************************************************//
        
        
        /**
        *  UIProgressView  进度条（UIProgressView）的用法
        *
        *  @param 180
        *  @param 150
        *
        *  @return
        */
        
        
        progressView.center=self.view.center
        progressView.progress=0.5 //默认进度50%
        progressView.progressTintColor=UIColor.greenColor()  //已有进度颜色
        progressView.trackTintColor=UIColor.grayColor()  //剩余进度颜色（即进度槽颜色）
        
        self.view.addSubview(progressView);
        
        
//        progressView.setProgress(0.8,animated:true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchDidChange(){
        //打印当前值
        if uiswitch.on
        {
            uiswitch.setOn(true , animated:true)
            uiswitch.on = true
             print(uiswitch.on)
            progressView.setProgress(1.0,animated:true)
        }
        else{
            uiswitch.setOn(false, animated:true)
            uiswitch.on = false
             print(uiswitch.on)
            progressView.setProgress(0.0,animated:true)
        }
       
    }
    
    func segmentDidchange(segmented:UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        //获得选择的文字
        print(segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex)!)
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageViewAnn.startAnimating()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        imageViewAnn
            .stopAnimating()
    }
    
    
}
