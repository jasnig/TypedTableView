//
//  CellProtocol.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/25.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import Foundation

protocol CellProtocol {
    associatedtype DataModel
    associatedtype CellOnClickAction
    // func 
    
    func updateCellWithData(data: DataModel, action: CellOnClickAction?)
    
    // 点击时响应的方法
    func cellDidClickAction(action: CellOnClickAction?)

}