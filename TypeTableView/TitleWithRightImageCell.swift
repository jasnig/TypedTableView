//
//  TitleWitRightImageCell.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/28.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class TitleWithRightImageCell: UITableViewCell {
    lazy var titleLabel: UILabel! = UILabel()
    lazy var iconView: UIImageView! = UIImageView()
    
    
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
        
        
        titleLabel.textColor = UIColor.blackColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(16.0)
        titleLabel.textAlignment = .Left
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 需要在这里面重新设置frame否则显示不正常
        
        let titleXCons = NSLayoutConstraint(item: titleLabel, attribute: .Leading, relatedBy: .Equal, toItem: contentView, attribute: .Leading, multiplier: 1.0, constant: 20.0)
        let titleCenterCons = NSLayoutConstraint(item: titleLabel, attribute: .CenterY, relatedBy: .Equal, toItem: contentView, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([titleXCons, titleCenterCons])
        
        let iconRCons = NSLayoutConstraint(item: iconView, attribute: .Trailing, relatedBy: .Equal, toItem: contentView, attribute: .Trailing, multiplier: 1.0, constant: -5.0)
        let iconCenterCons = NSLayoutConstraint(item: iconView, attribute: .CenterY, relatedBy: .Equal, toItem: titleLabel, attribute: .CenterY, multiplier: 1.0, constant: 0.0)
        let iconHeightCons = NSLayoutConstraint(item: iconView, attribute: .Height, relatedBy: .Equal, toItem: contentView, attribute: .Height, multiplier: 1.0, constant: -20.0)
        let iconWidthCons = NSLayoutConstraint(item: iconView, attribute: .Width, relatedBy: .Equal, toItem: iconView, attribute: .Height, multiplier: 1.0, constant: 0.0)
        
        
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addConstraints([iconRCons, iconCenterCons, iconHeightCons, iconWidthCons])
        
//        iconView.layer.cornerRadius = iconView.bounds.size.width / 2
//        iconView.clipsToBounds = true
    }
    
//    func switchOnClick(swh:UISwitch)  {
//        switchOnClickAction?()
//    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension TitleWithRightImageCell: CellProtocol {
    typealias DataModel = TitleCellData
    
    // 可以添加一个type参数来区分点击的是cell还是控件
    typealias CellOnClickAction = () -> Void
    //    typealias CellOnClickAction = (cell: TitleWithSwitchCell, switchS: UISwitch) -> Void
    
    
    func updateCellWithData(data: DataModel, action: CellOnClickAction?) {
        titleLabel.text = data.name
        switchOnClickAction = action
        iconView.image = UIImage(named: "AppIcon120x120")
    }
    
    func cellDidClickAction(action: CellOnClickAction?) {
        action?()
        //        print("haoha")
    }
    
}