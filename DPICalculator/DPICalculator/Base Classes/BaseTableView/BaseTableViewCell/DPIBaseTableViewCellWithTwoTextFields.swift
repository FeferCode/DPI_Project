//
//  DPIBaseTableViewCellWithTwoTextFields.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTwoTextFields: UITableViewCell {

    var dpiImage: UIImageView?
    var dpiField: UITextField?

    var dpiImageTwo: UIImageView?
    var dpiFieldTwo: UITextField?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiImage!)
        self.addSubview(self.dpiField!)
        self.addSubview(self.dpiImageTwo!)
        self.addSubview(self.dpiFieldTwo!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let firstData = data.first {
            self.dpiField?.placeholder = firstData.cellTextPlaceholder
            self.dpiImage?.addImage(firstData.cellImage!)
        }

        if let secondData = data.second {
            self.dpiFieldTwo?.placeholder = secondData.cellTextPlaceholder
            self.dpiImageTwo?.addImage(secondData.cellImage!)
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiField = UITextField()
        self.dpiImage = UIImageView()
        self.dpiFieldTwo = UITextField()
        self.dpiImageTwo = UIImageView()

        if let textField = self.dpiField {
            textField.tintColor = UIAppColorSet.getColor(.white)
            textField.backgroundColor = UIAppColorSet.getColor(.clear)
            textField.textColor = UIAppColorSet.getColor(.white)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let textField = self.dpiFieldTwo {
            textField.tintColor = UIAppColorSet.getColor(.white)
            textField.backgroundColor = UIAppColorSet.getColor(.clear)
            textField.textColor = UIAppColorSet.getColor(.white)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
    }

    private func setupConstrains() {
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)

            make.leading.equalToSuperview().offset(10)
        }

        self.dpiField?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)

            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiImageTwo?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)

            make.leading.equalTo(dpiField!.snp.trailing).offset(5)
        }

        self.dpiFieldTwo?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)

            make.leading.equalTo(dpiImageTwo!.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-10)
        }

        super.updateConstraints()
    }
}
