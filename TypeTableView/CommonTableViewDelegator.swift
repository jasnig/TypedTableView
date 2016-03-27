//
//  CommonTableViewDelegator.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/26.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class CommonTableViewDelegator: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var datas:[CellConfiguratorType]
    var tableView: UITableView!
    init(data: [CellConfiguratorType], tableView: UITableView) {
        self.tableView = tableView
        self.datas = data

        super.init()
        registCell()
    }
    
    
    func registCell() {
        for cellConfigType in datas {
            tableView.registerClass(cellConfigType.cellClass, forCellReuseIdentifier: cellConfigType.reusedIndentifier)
        }
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(datas)
        return datas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellConfigType = datas[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellConfigType.reusedIndentifier, forIndexPath: indexPath)
        cellConfigType.updateCell(cell)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cellConfigType = datas[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier(cellConfigType.reusedIndentifier, forIndexPath: indexPath)
        cellConfigType.cellOnClickAction(cell)
    }
}


