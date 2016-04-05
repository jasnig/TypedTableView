//
//  OnlyTitleCell.swift
//  TypeTableView
//
//  Created by jasnig on 16/3/28.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    lazy var titleLabel: UILabel! = UILabel(frame: CGRectZero)

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
        contentView.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = CGRect(x: 20, y: 15, width: 15, height: Int(contentView.bounds.size.height) - 15)
        titleLabel.textAlignment = .Left
        
        titleLabel.sizeToFit()
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

extension TitleCell: CellProtocol {
    typealias DataModel = TitleCellData
    typealias CellOnClickAction = () -> Void
    
    
    func updateCellWithData(data: DataModel, action: CellOnClickAction?) {
        titleLabel.text = data.name
        
    }
    
    func cellDidClickAction(action: CellOnClickAction?) {
        action?()
        //        print("haoha")
    }
 
}
