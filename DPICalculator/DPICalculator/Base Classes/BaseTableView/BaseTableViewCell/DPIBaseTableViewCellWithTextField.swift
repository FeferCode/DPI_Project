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
        self.setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let textField = self.dpiField, let image = self.dpiImage {
            textField.placeholder = data.cellTextPlaceholder
            image.addImage(data.cellImage!)
        }
    }

    private func configureCell() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiField = UITextField()
        self.dpiImage = UIImageView()
        if let textField = self.dpiField {

            textField.tintColor = UIAppColorSet.getColor(.white)
            textField.backgroundColor = UIAppColorSet.getColor(.clear)
            textField.textColor = UIAppColorSet.getColor(.white)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
    }

    private func setupConstrains(){
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.left.equalToSuperview().offset(50)
        }

        self.dpiField?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-50)
            make.left.equalToSuperview().offset(100)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
