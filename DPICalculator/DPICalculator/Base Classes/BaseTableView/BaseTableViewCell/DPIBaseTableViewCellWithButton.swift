//
//  DPITableViewCellWithButton.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithButton: UITableViewCell {

    var dpiCellData: DPIMainTableDataModel?
    var dpiButton:  UIButton?
    var dpiImage:   UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func didMoveToSuperview() {
        self.configureCell()
        self.addSubview(self.dpiButton!)
        self.setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let button = self.dpiButton {
            button.setTitle(data.cellText, for: .normal)
            button.setTitle(textForEnum.calculate.description, for: .normal)
            dpiImage?.addImage(data.cellImage!)
        }
    }

    private func configureCell() {
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
