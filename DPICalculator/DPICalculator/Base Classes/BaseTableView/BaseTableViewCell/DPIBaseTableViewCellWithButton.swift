//
//  DPITableViewCellWithButton.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithButton: UITableViewCell {

    var dpiButton:  UIButton?
    var dpiImage:   UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiButton!)
        self.setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {

        if let title = data.first?.cellText {
            self.dpiButton?.setTitle(title, for: .normal)
        }
        if let image = data.first?.cellImage {
            dpiImage?.addImage(image)
        }

    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiButton = BaseButton()
        if let button = self.dpiButton{
            button.tintColor = UIAppColorSet.getColor(.white)
            button.backgroundColor = UIAppColorSet.getColor(.clear)

            button.setTitleColor(UIAppColorSet.getColor(.baseNavigationColor), for: .highlighted)
        }
    }

    private func setupConstrains() {
        self.dpiButton?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.right.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(50)
            make.bottom.equalTo(0)
        }

        super.updateConstraints()
    }

}
