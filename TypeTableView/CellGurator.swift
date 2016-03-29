//
//  CellGurator.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import Foundation
import UIKit

struct CommonTableSectionData {
    let headerTitle: String?
    let footerTitle: String?
    let headerHeight: Int?
    let footerHeight: Int?
    var rows: [CellConfiguratorType] = []
    
    init(headerTitle: String,footerTitle: String, headerHeight: Int ,footerHeight : Int, rows: [CellConfiguratorType]) {
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
        self.headerHeight = headerHeight
        self.footerHeight = footerHeight
        self.rows = rows

    }
}

// 用于绑定cell的数据和方法
protocol CellConfiguratorType {
    var reusedIndentifier: String { get }
    var cellClass: AnyClass { get }
    var canSelected: Bool { get }
    var cellHeight: Int { get }
    func updateCell(cell: UITableViewCell)
    func cellOnClickAction(cell: UITableViewCell)
    
}

extension CellConfiguratorType {
    var canSelected: Bool {
        return true
    }
    var cellHeight: Int {
        return 44
    }
}

// cell的实际构造器
struct CellGurator<Cell where Cell: CellProtocol, Cell: UITableViewCell> {
    
    let dataModel: Cell.DataModel
    let cellDidClickAction: Cell.CellOnClickAction
    
    let reusedIndentifier: String = String(Cell)
    let cellClass: AnyClass = Cell.self
    
    var canSelected: Bool = true
    var cellHeight: Int = 44
    
    init(dataModel: Cell.DataModel, cellDidClickAction: Cell.CellOnClickAction, canSelected: Bool = true , cellHeight: Int = 44) {
        self.dataModel = dataModel
        self.cellDidClickAction = cellDidClickAction
        self.canSelected = canSelected
        self.cellHeight = cellHeight
    }
}

extension CellGurator: CellConfiguratorType {
    func updateCell(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.updateCellWithData(dataModel, action: cellDidClickAction)
        }
    }
    func cellOnClickAction(cell: UITableViewCell) {
        if let cell = cell as? Cell {
            cell.cellDidClickAction(cellDidClickAction)
        }
    }
}