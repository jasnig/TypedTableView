//
//  ViewController.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    typealias ClickAction = () -> Void
    
    lazy var tableView = UITableView(frame: CGRectZero, style: .Grouped)
    
    var datas: [CommonTableSectionData] = []
    //!!!: 这个代理中间人必须是被强持有的, 否则不能生效
    var delegator:CommonTableViewDelegator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bulidData()
        delegator = CommonTableViewDelegator(data: datas,tableView: tableView)
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = delegator
        tableView.dataSource = delegator
//        tableView.separatorStyle = .None

//         performSelector(NSSelectorFromString("test"))

    }
    func test()  {
        print("22222222")
    }
    
    func switchOnClick(switchS: AnyObject) {
        if switchS is UISwitch {
            print(switchS.on)

        }

    }

    func bulidData() {
        
        let row1 = CellGurator<TitleCell>(dataModel: TitleCellData(name: "只有标题"), cellDidClickAction: test)
        let row2 = CellGurator<TitleWithValueCell>(dataModel: TitleCellData(name: "标题和详情"), cellDidClickAction: test1)
        let row3 = CellGurator<TitleWithSwitchCell>(dataModel: TitleCellData(name: "有开关"), cellDidClickAction: switchOnClick, canSelected: false)
        
        let row4 = CellGurator<TitleWithRightImageCell>(dataModel: TitleCellData(name: "右边有头像"), cellDidClickAction: test, cellHeight: 60)
        let row5 = CellGurator<TestCell>(dataModel: TestCelldData(name: "哥后台"), cellDidClickAction: testblosure)
        let row6 = CellGurator<TestCell>(dataModel: TestCelldData(name: "果然是"), cellDidClickAction: testblosure)

        let rows1: [CellConfiguratorType] = [row1,row2,row3,row4,row5,row6]
        let rows2: [CellConfiguratorType] = [row1,row2,row3,row4,row5,row6]

        let section1 = CommonTableSectionData(headerTitle: "edc", footerTitle: "rqewr", headerHeight: 55, footerHeight: 28, rows: rows1)
        let section2 = CommonTableSectionData(headerTitle: "edc", footerTitle: "rqewr", headerHeight: 55, footerHeight: 28, rows: rows2)

        datas = [section1,section2,section2,section2,section2,section2,section2,section2,section2,section2,section2,section2,section2,section2,section2,section2]

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
        print("tgb1111111")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


