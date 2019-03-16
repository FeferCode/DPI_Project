//
//  DPIBaseTableViewCellWithTextField.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTextField: UITableViewCell, UITextFieldDelegate {

    var dpiField: UITextField?
    var dpiImage: UIImageView?
    var typingTime: Timer?
    var cellDataType: DPIUserCellDataEnum?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiField!)
        self.addSubview(self.dpiImage!)
        self.setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let text = data.first?.cellTextPlaceholder {
            self.dpiField?.placeholder = text
        }
        if let image = data.first?.cellImage {
            self.dpiImage?.addImage(image)
        }
        if let dataType = data.first?.cellDataType {
            self.cellDataType = dataType
            if dataType == .diagonalInInch {
                self.dpiField?.keyboardType = .decimalPad
            }
        }
        if let cellTag = data.first?.cellTag {
            self.tag = cellTag
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.shared.getColor(.clear)
        self.dpiField = UITextField()
        self.dpiImage = UIImageView()
        if let textField = self.dpiField {
            textField.tintColor = UIAppColorSet.shared.getColor(.white)
            textField.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            textField.textColor = UIAppColorSet.shared.getColor(.white)
            textField.keyboardType = .numberPad
            textField.textAlignment = .left
            textField.font = UIFont.boldSystemFont(ofSize: 12.0)
            textField.delegate = self
        }
    }

    private func setupConstrains(){
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.leading.equalToSuperview().offset(50)
        }

        self.dpiField?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-50)

            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
