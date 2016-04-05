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
    var testdata = TitleCellData(name: "测试标题和开关", isOn: false)
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
        
        bulidData()
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
        
        let row1 = CellGurator<TitleCell>(dataModel: TitleCellData(name: "只有标题"), cellDidClickAction: test)
        let row2 = CellGurator<TitleWithValueCell>(dataModel: TitleCellData(name: "测试值回填", detailValue: value), cellDidClickAction: test1)
        let row3 = CellGurator<TitleWithSwitchCell>(dataModel: testdata, cellDidClickAction: switchOnClick, canSelected: false)
        
        let row4 = CellGurator<TitleWithRightImageCell>(dataModel: TitleCellData(name: "右边有头像",iconName: "AppIcon120x120"), cellDidClickAction: test, cellHeight: 60)
        let row5 = CellGurator<TitleWithLeftImageCell>(dataModel: TitleCellData(name: "左边有头像",iconName: "AppIcon120x120"), cellDidClickAction: test)
        let row6 = CellGurator<TitleWithLeftImageCell>(dataModel: TitleCellData(name: "ceshi", detailValue: value), cellDidClickAction: test)

        let rows1: [CellConfiguratorType] = [row1,row2,row3,row4,row5, row6]

        let section1 = CommonTableSectionData(headerTitle: "edc", footerTitle: "rqewr", headerHeight: 55, footerHeight: 28, rows: rows1)

        datas = [section1]
    }
    
    
    func testblosure(cell: TestCell, btn: UIButton)  {
        print(cell)
        print(btn.titleLabel?.text)
    }
    
    func testblosure1(cell: TestCell, btn: UIButton)  {
        print("-------------------")
        print(btn.titleLabel?.text)
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



