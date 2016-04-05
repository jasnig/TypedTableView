//
//  TitleCellData.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/29.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import Foundation


struct TitleCellData {
    /// cell的标题
    var name: String
    /// cell右侧的文字
    var detailValue:String?
    /// cell 左边或者右边的图片名字
    var iconName: String?
    
    /// cell 右侧的开关的状态
    var isOn: Bool
    init(name: String, detailValue: String? = nil, iconName: String? = nil, isOn:Bool = true) {
        self.name = name
        self.detailValue = detailValue
        self.iconName = iconName
        self.isOn = isOn
    }
}
