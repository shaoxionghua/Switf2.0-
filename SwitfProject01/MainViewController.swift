//
//  MainViewController.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/19.
//  Copyright © 2015年 danggui. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //一共包含了两个视图
        let viewMain = FirstViewController()
        viewMain.title = "首页"
        let viewSetting = SecondViewController()
        viewSetting.title = "设置"
        
        //分别声明两个视图控制器
        let main = UINavigationController(rootViewController:viewMain)
        main.tabBarItem.image = UIImage(named:"item1Sel.png")
        let setting = UINavigationController(rootViewController:viewSetting)
        setting.tabBarItem.image = UIImage(named:"item2Sel.png")
        self.viewControllers = [main,setting]
        
        //默认选中的是游戏主界面视图
        self.selectedIndex = 0

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
