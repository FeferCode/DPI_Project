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
    var dpiImage: UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureButton()
        self.addSubview(self.dpiField!)
        self.updateConstraints()
    }

    private func configureButton() {
        self.dpiField = UITextField()
        if let textField = self.dpiField{
            textField.tintColor = UIAppColorSet.getColor(.white)
            textField.backgroundColor = UIAppColorSet.getColor(.clear)
            textField.text = textForEnum.calculate.description
        }
    }

    internal override func updateConstraints() {
        self.dpiField?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(3)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        super.updateConstraints()
    }

}
