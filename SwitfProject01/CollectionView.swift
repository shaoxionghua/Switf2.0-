////
////  CollectionView.swift
////  SwitfProject01
////
////  Created by danggui on 15/11/19.
////  Copyright © 2015年 danggui. All rights reserved.
////
//
//import UIKit
//
//class CollectionView: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
//    
//
//    var colltionView : UICollectionView?
//    var dataArr = NSMutableArray()
//
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        var layout = UICollectionViewFlowLayout()
//        colltionView = UICollectionView(frame: CGRectMake(0, 0, width, height), collectionViewLayout: layout)
//        //注册一个cell
//        colltionView! .registerClass(Home_Cell.self, forCellWithReuseIdentifier:"cell")
//        //注册一个headView
//        colltionView! .registerClass(Home_HeadView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "headView")
//        colltionView?.delegate = self;
//        colltionView?.dataSource = self;
//        
//        colltionView?.backgroundColor = UIColor.whiteColor()
//        //设置每一个cell的宽高
//        layout.itemSize = CGSizeMake((width-30)/2, 250)
//        self.view .addSubview(colltionView!)
//        self .getData()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    //返回多少个组
//    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        
//        return 1
//    }
//    //返回多少个cell
//    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dataArr.count
//    }
//    //返回自定义的cell
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! Home_Cell
//        var model = GoodsModel()
//        model = dataArr[indexPath.row] as! GoodsModel
//        let url : NSURL = NSURL(string: model.image_url as String)!
//        cell.imgView!.hnk_setImageFromURL(url)
//        cell.layer.borderWidth = 0.3;
//        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
//        cell.titleLabel!.text = model.short_name
//        cell.priceLabel!.text = "￥"+model.p_price
//        cell.readLabel!.text = "💗"+model.like_count
//        return cell
//    }
//    //返回HeadView的宽高
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHe
//        ![Swift_CollTionView.gif](http://upload-images.jianshu.io/upload_images/671504-4d2bb67cf1e9aed7.gif?imageMogr2/auto-orient/strip)aderInSection section: Int) -> CGSize{
//        
//        return CGSize(width: width, height: height/1.6)
//        }
//        
//        //返回自定义HeadView或者FootView，我这里以headview为例
//        func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
//        var v = Home_HeadView()
//        if kind == UICollectionElementKindSectionHeader{
//        
//        v = colltionView!.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "headView", forIndexPath: indexPath) as! Home_HeadView
//        }
//        return v
//        }
//        //返回cell 上下左右的间距
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
//        return UIEdgeInsetsMake(5, 10, 5, 10)
//        }
//    
//}
