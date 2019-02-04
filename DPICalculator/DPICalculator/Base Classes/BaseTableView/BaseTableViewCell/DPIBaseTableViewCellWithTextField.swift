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
    weak var delegate: DPICellDelegate?
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
            textField.delegate = self
        }
        self.dpiField?.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        addButtons()
    }

    //MARK :- Button configuration
    private func addButtons(){
        let bar = UIToolbar()
        let back = UIBarButtonItem(title: "<-", style: .plain, target: self, action: #selector(previewTFResponder))
        let next = UIBarButtonItem(title: "->", style: .plain, target: self, action: #selector(nextTFResponder))
        let reset = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(deleteTextFieldData))
        let calculate = UIBarButtonItem(title: "Calculate", style: .plain, target: self, action: #selector(calculateData))
        let done = UIBarButtonItem(title: "Hide Keyboard", style: .plain, target: self, action: #selector(hideKeyboard))
        bar.items = [back, reset, done, calculate, next]
        bar.sizeToFit()
        dpiField?.inputAccessoryView = bar
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

    @objc func textFieldDidEditingChanged(_ textField: UITextField) {
        sendDataForCalculation()
    }

    @objc func sendDataForCalculation() {
        guard let dataType = self.cellDataType, let value = dpiField?.text else {
            return
        }

        if value.count == 0 {
            return
        }

        guard let numberValue = Float(String(format:"%.2f", (Float)(value)!)) else {
            return
        }
        delegate?.userEndEditingCell(dataType: dataType, value: numberValue)
    }

    @objc func calculateData(){
        delegate?.calculate()
    }

    @objc func hideKeyboard(){
        delegate?.hideKeyboard()
    }

    @objc func deleteTextFieldData(){
        self.dpiField?.text?.removeAll()
    }

    @objc func nextTFResponder(){
        delegate?.nextTFResponder(tag: self.tag, next: true)
    }

    @objc func previewTFResponder(){
        delegate?.nextTFResponder(tag: self.tag, next: false)
    }
}
