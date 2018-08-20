//
//  DPIBaseTableViewCellWithTwoTextFields.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTwoTextFields: UITableViewCell {

    var dpiCellData: DPIMainTableDataModel?
    var dpiImage: UIImageView?
    var dpiField: UITextField?

    var dpiImageTwo: UIImageView?
    var dpiFieldTwo: UITextField?


    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCell()
        self.addSubview(self.dpiImage!)
        self.addSubview(self.dpiField!)
        self.addSubview(self.dpiImageTwo!)
        self.addSubview(self.dpiFieldTwo!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let textField = self.dpiField,
            let dpiImage = self.dpiImage,
            let textFieldTwo = self.dpiFieldTwo,
            let dpiImageTwo = self.dpiImageTwo  {

            textField.placeholder = data.cellTextPlaceholder
            dpiImage.addImage(data.cellImage!)

            textFieldTwo.placeholder = data.cellTextPlaceholder
            dpiImageTwo.addImage(data.cellImage!)
        }
    }

    private func configureCell() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiField = UITextField()
        self.dpiImage = UIImageView()
        self.dpiFieldTwo = UITextField()
        self.dpiImageTwo = UIImageView()

        if let label = self.dpiField, let labelTwo = self.dpiFieldTwo  {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            labelTwo.textColor = UIAppColorSet.getColor(.white)
            labelTwo.backgroundColor = UIAppColorSet.getColor(.clear)
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
