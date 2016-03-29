//
//  CommonTableViewDelegator.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/26.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class CommonTableViewDelegator: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var datas:[CommonTableSectionData]
    var tableView: UITableView!
    init(data: [CommonTableSectionData], tableView: UITableView) {
        self.tableView = tableView
        self.datas = data

        super.init()
        registCell()
    }
    
    
    func registCell() {
        
        for sectionsData in datas {
            let rowsData = sectionsData.rows
            for rowdata in rowsData {
        
                tableView.registerClass(rowdata.cellClass, forCellReuseIdentifier: rowdata.reusedIndentifier)

            }
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionsData = datas[section]
        return sectionsData.rows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let sectionsData = datas[indexPath.section]
        let rawsData = sectionsData.rows
        let rawData = rawsData[indexPath.row]

 
        let cell = tableView.dequeueReusableCellWithIdentifier(rawData.reusedIndentifier, forIndexPath: indexPath)
        
        cell.accessoryType = rawData.canSelected ? .DisclosureIndicator : .None
        cell.selectionStyle = rawData.canSelected ? .Default : .None
        
        
        // 自定义separatorInset
        // 注意, sectiontitle, footertitle titlelabel...都会随着改变 (自定义后就没有影响了)
//        if tableView.respondsToSelector(Selector("setSeparatorInset:")) {
//            tableView.separatorInset = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 0)
//        }
        
//        if tableView.respondsToSelector(Selector("setLayoutMargins:")) {
//            tableView.layoutMargins =  UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
//
//        }
        
        rawData.updateCell(cell)
        return cell
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let sectionsData = datas[indexPath.section]
        let rawsData = sectionsData.rows
        let rawData = rawsData[indexPath.row]
        // 这里不要使用重用方法获取,之前就是因为在这里使用重用机制获取cell,导致点击后获取到的cell的内容并没有再次更新, 所以数据显示不正常
        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        rawData.updateCell(cell)
        rawData.cellOnClickAction(cell!)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionsData = datas[section]
        return sectionsData.headerTitle
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let sectionsData = datas[section]
        return sectionsData.footerTitle
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let sectionsData = datas[indexPath.section]
        let rawsData = sectionsData.rows
        let rawData = rawsData[indexPath.row]
        return CGFloat(rawData.cellHeight)
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let sectionsData = datas[section]
        return CGFloat(sectionsData.footerHeight ?? 0)
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionsData = datas[section]
        return CGFloat(sectionsData.headerHeight ?? 0)
    }

    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
//        tableView.addLineForCell(cell, atIndexPath: indexPath, leftPadding: 25)

    }
    
    //    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
    //        let sectionsData = datas[indexPath.section]
    //        let rawsData = sectionsData.rows
    //        let rawData = rawsData[indexPath.row]
    //
    //        if !rawData.canSelected {
    //            return nil
    //        }
    //        return indexPath
    //    }
    
//     返回false的时候相应的cell就不能响应选中的代理方法
        func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
            let sectionsData = datas[indexPath.section]
            let rawsData = sectionsData.rows
            let rawData = rawsData[indexPath.row]
    
            return rawData.canSelected
        }
    
}


