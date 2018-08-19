//
//  DPIBaseTableViewCellWithTextField.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTextField: UITableViewCell {

    var dpiCellData: DPIMainTableDataModel?
    var dpiField: UITextField?
    var dpiImage: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCell()
        self.addSubview(self.dpiField!)
        self.addSubview(self.dpiImage!)
        self.updateConstraints()
    }

    private func configureCell() {
        self.dpiField = UITextField()
        self.dpiImage = UIImageView()
        if let textField = self.dpiField, let image = self.dpiImage {

            textField.tintColor = UIAppColorSet.getColor(.white)
            textField.backgroundColor = UIAppColorSet.getColor(.clear)
            textField.textColor = UIAppColorSet.getColor(.white)
            textField.keyboardType = .numberPad
            textField.textAlignment = .center

            if let data = dpiCellData {
                textField.placeholder = data.cellTextPlaceholder
                image.addImage(data.cellImage!)
            }
        }
    }

    internal override func updateConstraints() {
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.left.equalTo(snp.leftMargin).offset(10)
        }

        self.dpiField?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.right.equalTo(snp.rightMargin)
            make.left.equalTo(100)

        }
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        super.updateConstraints()
    }
}
