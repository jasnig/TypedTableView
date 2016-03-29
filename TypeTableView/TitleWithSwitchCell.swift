//
//  TitleWithSwitchCell.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/28.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class TitleWithSwitchCell: UITableViewCell {
    lazy var titleLabel: UILabel! = UILabel()
    lazy var switchS: UISwitch! = UISwitch()
    
    var switchOnClickAction: CellOnClickAction?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configUI()
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configUI () {
        
        switchS.addTarget(self, action: #selector(self.switchOnClick(_:)), forControlEvents: .ValueChanged)
        
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(16.0)
        titleLabel.textAlignment = .Left
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchS)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 需要在这里面重新设置frame否则显示不正常
        
        let titleXCons = NSLayoutConstraint(item: titleLabel, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .Leading, multiplier: 1.0, constant: 20.0)
        let titleCenterCons = NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([titleXCons, titleCenterCons])
        
        let switchRCons = NSLayoutConstraint(item: switchS, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1.0, constant: -20.0)
        let switchCenterCons = NSLayoutConstraint(item: switchS, attribute: .CenterY, relatedBy: .Equal, toItem: titleLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        switchS.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([switchRCons, switchCenterCons])
        
    }
    
    func switchOnClick(swh:UISwitch)  {
        switchOnClickAction?(switchS: swh)
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

extension TitleWithSwitchCell: CellProtocol {
    typealias DataModel = TitleCellData
    typealias CellOnClickAction = ( switchS: AnyObject) -> Void
//    typealias CellOnClickAction = (cell: TitleWithSwitchCell, switchS: UISwitch) -> Void

    
    func updateCellWithData(data: DataModel, action: CellOnClickAction?) {
        titleLabel.text = data.name
        switchOnClickAction = action
    }
    
    func cellDidClickAction(action: CellOnClickAction?) {
        action?(switchS: self.switchS)
        //        print("haoha")
    }
    
}


