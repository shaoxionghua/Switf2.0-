//
//  FirstViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/16.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,EditViewControllerDelegate{
    
    @IBOutlet weak var MyLAB: UILabel!
    @IBOutlet var myTable: UITableView?
    @IBOutlet var searchBar : UISearchBar!
    var typeArray:NSArray!
    
    var ctrlsel:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hello,Swift"
        MyLAB.text = "HELLO,MyBestFriend!"
        
   
        typeArray = ["UIlabel", "UIButton", "UITextField", "OtherWidget", "OtherWidget2","UIScrollView","CoreMotion","UIGestureRecognizer","UIWebView","UISearchViewController","CollectionView","UIPageControl"];
        self.ctrlsel = typeArray as! [String]
        
        self.myTable!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.ctrlsel.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let identifier = "CellIdentifier"
        var cell :UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("CellIdentifier")
        
        cell = UITableViewCell(style: .Default, reuseIdentifier: identifier)
        
        let string :String = self.ctrlsel [indexPath.row] 
        cell!.textLabel!.text = string
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        
        //        if i == 0{
        //            print("ssss");
        //        }
        //        else
        //        {
        //            //        let alert = UIAlertController(title: "Alert", message: "You have selected \(indexPath.row) Row ", preferredStyle: UIAlertControllerStyle.Alert)
        //            //        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        //            //        self.presentViewController(alert, animated: true, completion: nil)
        //
        //            //push方法1
        //            //        let studyController: UIButtonViewController? = UIButtonViewController(nibName: "UIButtonViewController", bundle: nil)
        //            //        self.navigationController?.pushViewController(studyController!, animated:true)
        //            //
        //            //push方法2
        //            let washingAddress = UIButtonViewController();
        //            washingAddress.title = "UIBuuton"
        //            self.navigationController?.pushViewController(washingAddress, animated:true)
        //
        //        }

        
        
        let i = indexPath.row
        switch i {
        case 0:
            //push方法2
            let labelView = UILabelViewController()
            labelView.title = "UILabel"
            self.navigationController?.pushViewController(labelView, animated:true)
        case 1:
            //push方法2
            let washingAddress = UIButtonViewController()
            washingAddress.title = "UIBuuton"
            self.navigationController?.pushViewController(washingAddress, animated:true)
        case 2:
            //push方法2
            let UITextField = UITextFieldViewController()
            UITextField.title = "UITextField"
            self.navigationController?.pushViewController(UITextField, animated:true)
        case 3:
            let OtherWidget = UIViewOtherWidget()
            OtherWidget.title = "OtherWidget"
            self.navigationController?.pushViewController(OtherWidget, animated: true)
        case 4:
            let Widget2 = OtherWidget2()
            Widget2.title = "Widget2"
            self.navigationController?.pushViewController(Widget2, animated: true)
        case 5:
            let Scroll = UIScrollViewController()
            Scroll.title = "UIScrollView"
            self.navigationController?.pushViewController(Scroll, animated: true)
        case 6:
            let CoreMotion = CoreMotionViewController()
            CoreMotion.title = "CoreMotion"
            self.navigationController?.pushViewController(CoreMotion, animated: true)
        case 7:
            let UIGesture = UIGestureRecognizerViewController()
            UIGesture.title = "UIGestureRecognizer"
            self.navigationController?.pushViewController(UIGesture, animated: true)
        case 8:
            let WebView = UIWebViewController()
            WebView.title = "UIWebView"
            self.navigationController?.pushViewController(WebView, animated: true)
        case 9:
            let Search = UISearchViewController()
            Search.title = "UISearchController"
            self.navigationController?.pushViewController(Search, animated: true)
        case 10:
            print("没有实现")
        case 11:
            let PageControl = UIPageScrollView()
            PageControl.title = "UIPageControl"
            PageControl.delegate = self
            PageControl.oldInfo = "Delegate"
            self.navigationController?.pushViewController(PageControl, animated: true)

        default:
            "default"
        }

    }

    
    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        // 没有搜索内容时显示全部组件
        if searchText == "" {
            self.ctrlsel = typeArray as! [String]
        }
        else { // 匹配用户输入内容的前缀
            self.ctrlsel = []
            for ctrl in typeArray {
                if ctrl.componentsSeparatedByString(searchText).count > 1 {
                   self.ctrlsel.append(ctrl as! String)
                }
                else if ctrl.lowercaseString.hasPrefix(searchText) {
                    self.ctrlsel.append(ctrl as! String)
                }
                
            }
        }
        // 刷新Table View显示
        myTable!.reloadData()
    }
    
//     搜索代理UISearchBarDelegate方法，点击虚拟键盘上的Search按钮时触发
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    
    func editInfo(controller:UIPageScrollView, newInfo:String){
        print(newInfo)
        //关闭编辑页面
        controller.navigationController?.popToViewController(self, animated: true)
    }
    
    func editInfoDidCancer(controller:UIPageScrollView){
        //关闭编辑页面
        controller.navigationController?.popToViewController(self, animated: true)
    }
    
    
    
    
    
    
}