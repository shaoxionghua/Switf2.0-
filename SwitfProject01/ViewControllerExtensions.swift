//
//  ViewControllerExtensions.swift
//  SwitfProject01
//
//  Created by danggui on 15/11/19.
//  Copyright © 2015年 danggui. All rights reserved.
//

import Foundation
import UIKit

extension UISearchViewController: UITableViewDataSource
{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.countrySearchController.active)
        {
            return self.searchArray.count
        } else
        {
            return self.schoolArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell
    {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath)
        
        
        if (self.countrySearchController.active)
        {
            cell.textLabel?.text = self.searchArray[indexPath.row]
            return cell
        }
            
        else
        {
            cell.textLabel?.text = self.schoolArray[indexPath.row]
            return cell
        }
    }
}

extension UISearchViewController: UITableViewDelegate
{
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

extension UISearchViewController: UISearchResultsUpdating
{
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        self.searchArray.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@",
            searchController.searchBar.text!)
        let array = (self.schoolArray as NSArray).filteredArrayUsingPredicate(searchPredicate)
        self.searchArray = array as! [String]
    }
}