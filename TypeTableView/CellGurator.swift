//
//  CellGurator.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import Foundation
import UIKit

// 用于绑定cell的数据和方法
protocol CellConfiguratorType {
    var reusedIndentifier: String { get }
    var cellClass: AnyClass { get }
    func updateCell(cell: UITableViewCell)
    func cellOnClickAction(cell: UITableViewCell)
    
}


// cell的实际构造器
struct CellGurator<Cell where Cell: CellProtocol, Cell: UITableViewCell> {
    let dataModel: Cell.DataModel
    let cellDidClickAction: Cell.CellOnClickAction
    let reusedIndentifier: String = String(Cell)
    let cellClass: AnyClass = Cell.self
    
    
}

extension CellGurator: CellConfiguratorType {
    func updateCell(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.updateCellWithData(dataModel)
        }
    }
    func cellOnClickAction(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.cellDidClickAction(cellDidClickAction)
        }
    }
}