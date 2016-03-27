//
//  ViewController.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit


struct CommonTableSectionData {
    let headerTitle: String?
    let footerTitle: String?
    let headerHeight: Int?
    let footerHeight: Int?
    var rows: [CommonTableRowData] = []
    
    
}

struct CommonTableRowData {
    let title: String?
    let height: Int?
    var canSelected = true
    var dataModel: AnyClass
}


class ViewController: UIViewController {
    typealias ClickAction = () -> Void
    
    lazy var tableView = UITableView(frame: CGRectZero, style: .Plain)
    
    var datas: [CellConfiguratorType] = []
    //!!!: 这个代理中间人必须是被强持有的, 否则不能生效
    var delegator:CommonTableViewDelegator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegator = CommonTableViewDelegator(data: [CellGurator<TestCell>(dataModel: TestCelldData(name: "fsdfa"), cellDidClickAction: #selector(self.test))],tableView: tableView)
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = delegator
        tableView.dataSource = delegator
//         performSelector(NSSelectorFromString("test"))

    }
    
    func bulidData() {
        
//        let rows1 = [CommonTableRowData()]
        
//        let section1 = CommonTableSectionData(headerTitle: "", footerTitle: "", headerHeight: 12, footerHeight: 13, rows: rows1)
        
    }
    

    func test()  {
        print("haohao")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


