//
//  ViewController.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView = UITableView(frame: CGRectZero, style: .Grouped)
    
    var datas: [CommonTableSectionData] = []
    //!!!: 这个代理中间人必须是被强持有的, 否则不能生效
    var delegator:CommonTableViewDelegator!
    var testdata = TypedCellDataModel(name: "测试标题和开关", isOn: false)
    var name = "测试"
    var value = "测试详情"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bulidData()
        delegator = CommonTableViewDelegator(tableView: tableView, data: {[unowned self] () -> [CommonTableSectionData] in
            self.datas
        })
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = delegator
        tableView.dataSource = delegator
        view.backgroundColor = UIColor.whiteColor()
    }
    func test()  {
        name = "ceshi"
        value = "成功"
        tableView.reloadData()
        print("22222222")
    }
    
    func switchOnClick(switchS: UISwitch) {
        testdata.isOn = !testdata.isOn
        bulidData()
        tableView.reloadData()
        print(switchS.on)

    }

    func bulidData() {
        
        let row1 = CellBuilder<TitleOnlyCell>(dataModel: TypedCellDataModel(name: "只有标题"), cellDidClickAction: {[unowned self] in
            
                self.test()
            })
        let row2 = CellBuilder<TitleWithDetailValueCell>(dataModel: TypedCellDataModel(name: "测试值回填", detailValue: value), cellDidClickAction:  {[unowned self] in
            self.test1()
        })
        let row3 = CellBuilder<TitleWithSwitchCell>(dataModel: testdata, canSelected: true, cellDidClickAction: {[unowned self](switchS: UISwitch) in
            self.switchOnClick(switchS)
        })
        let row4 = CellBuilder<TitleWithRightImageCell>(dataModel: TypedCellDataModel(name: "右边有头像",iconName: "AppIcon120x120"), cellHeight: 60, cellDidClickAction: {[unowned self] in
            
            self.test()
        })

        let row5 = CellBuilder<TitleWithLeftImageCell>(dataModel: TypedCellDataModel(name: "左边有头像",iconName: "AppIcon120x120"), cellDidClickAction: {[unowned self] in
            
            self.test()
        })

        let row6 = CellBuilder<TitleWithLeftImageCell>(dataModel: TypedCellDataModel(name: "ceshi", detailValue: value), cellDidClickAction: {[unowned self] in
            
            self.test()
        })


        let rows1: [CellConfiguratorType] = [row1,row2,row3,row4,row5, row6]
        let rows2: [CellConfiguratorType] = [row1,row2,row3,row4,row5, row6]
        let rows3: [CellConfiguratorType] = [row1,row2,row3,row4,row5, row6]

        let section1 = CommonTableSectionData(headerTitle: "edc", footerTitle: "rqewr", headerHeight: 55, footerHeight: 28, rows: rows1)
        let section2 = CommonTableSectionData(headerTitle: "edc", footerTitle: "rqewr", headerHeight: 55, footerHeight: 28, rows: rows2)
        let section3 = CommonTableSectionData(headerTitle: "edc", footerTitle: "rqewr", headerHeight: 55, footerHeight: 28, rows: rows3)

        datas = [section1, section2, section3]
    }
    
    func test1()  {
        
        let vc = TextController()

        vc.doneBtnOnClick = {[unowned self] (string: String) in
        
            self.value = string
            self.bulidData()
            self.tableView.reloadData()

        }
        
        // 或者 
//        let vc = TextController { [unowned self] (string) in
//            
//            self.value = string
//            
//            self.bulidData()
//            self.tableView.reloadData()
//        }
        
        presentViewController(vc, animated: true, completion: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



