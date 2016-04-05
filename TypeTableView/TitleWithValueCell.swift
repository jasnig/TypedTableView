//
//  TitleAndValueCell.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/28.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class TitleWithValueCell: UITableViewCell {
    
    lazy var titleLabel: UILabel! = UILabel()
    lazy var valueLabel:UILabel! = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    
     func configUI() {
        
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(16.0)
        titleLabel.textAlignment = .Left

        valueLabel.textColor = UIColor.lightGrayColor()
        valueLabel.font = UIFont.systemFontOfSize(14.0)
        valueLabel.textAlignment = .Right
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let titleXCons = NSLayoutConstraint(item: titleLabel, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .Leading, multiplier: 1.0, constant: 20.0)
        let titleCenterCons = NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //添加约束到父视图中
        contentView.addConstraints([titleXCons, titleCenterCons])
        
        let valueRCons = NSLayoutConstraint(item: valueLabel, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        let valueYCons = NSLayoutConstraint(item: valueLabel, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Top, multiplier: 1.0, constant: 0.0)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([valueRCons, valueYCons])


    
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension TitleWithValueCell: CellProtocol {
    typealias DataModel = TitleCellData
    typealias CellOnClickAction = () -> Void
    
    
    func updateCellWithData(data: DataModel, action: CellOnClickAction?) {
        titleLabel.text = data.name
        valueLabel.text = data.detailValue
    }
    
    func cellDidClickAction(action: CellOnClickAction?) {
        action?()
        //        print("haoha")
    }
    
}

