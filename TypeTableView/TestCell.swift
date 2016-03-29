//
//  TestCell.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

struct TestCelldData {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

class TestCell: UITableViewCell {
    var testBtnOnClickBlosure:CellOnClickAction?
    
    lazy var titleLabel: UILabel! = UILabel(frame: CGRect(x: 15, y: 15, width: 100, height: 15))
    
    lazy var button: UIButton! = UIButton(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        button.setTitle( "测试", forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.addTarget(self, action: #selector(self.testBtnOnClick(_:)), forControlEvents: .TouchUpInside)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(button)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 需要在这里面重新设置frame否则显示不正常
        titleLabel.frame = CGRect(x: 15, y: 15, width: 100, height: 15)
        button.frame = CGRect(x: 150, y: 10, width: 50, height: 30)

    }

    func testBtnOnClick(btn:UIButton)  {
        testBtnOnClickBlosure?(cell: self, btn: btn)
    }
    
}

extension TestCell: CellProtocol {
    // FIXME: the diffenence between the use of typealias and associatedtype
    //typealias用于指定确切类型时
    //associatedtype用于关联类型时
    typealias DataModel = TestCelldData
    typealias CellOnClickAction = (cell: TestCell, btn: UIButton) -> Void

    
    func updateCellWithData(data: DataModel, action: CellOnClickAction?) {
        titleLabel.text = data.name
        titleLabel.textColor = UIColor.brownColor()
        testBtnOnClickBlosure = action
    }

    func cellDidClickAction(action: CellOnClickAction?) {
        action?(cell: self, btn: self.button)
//        print("haoha")
    }
}

extension UIView {
    var viewController: UIViewController? {
        var currentView:UIView? = self
        // 当还有superView的时候就循环
        while currentView != nil {
            
//            if let nextView = currentView!.superview {
//                
            // 遍历到superView是uiwindow的时候就结束了
//                if nextView is UIWindow {
//                    let responsder = currentView!.nextResponder()
//                    if responsder is UIViewController {
//                        return responsder as? UIViewController
//                    }
//                    break
//                }
//                
//                currentView = nextView
//                print(currentView)
//            }
            
            // 当还有下一级响应者的时候
            if let responder = currentView!.nextResponder() {
                if responder is UIViewController {
                    return responder as? UIViewController
                } else {
                    if let nextView = currentView!.superview {
                        currentView = nextView
                    }
                }
                
            }
        }
        
        return nil
        
    }
}
