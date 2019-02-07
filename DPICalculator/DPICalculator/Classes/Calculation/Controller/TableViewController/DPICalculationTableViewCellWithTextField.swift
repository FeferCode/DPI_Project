//
//  CalculationTableViewCell.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 07/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPICalculationTableViewCellWithTextField: DPIBaseTableViewCellWithTextField {
    weak var delegate: DPICellDelegate?

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.dpiField?.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        addButtons()
    }

    //MARK :- Button configuration
    private func addButtons(){
        let bar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let back = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(previewTFResponder))
        let reset = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(deleteTextFieldData))
        let hide = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(hideKeyboard))
        let calculate = UIBarButtonItem(title: "Calculate", style: .done, target: self, action: #selector(calculateData))
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextTFResponder))
        bar.items = [back, flexibleSpace, reset, flexibleSpace, calculate, flexibleSpace, hide, flexibleSpace, next]
        bar.sizeToFit()
        dpiField?.inputAccessoryView = bar
    }

    @objc func textFieldDidEditingChanged(_ textField: UITextField) {
        sendDataForCalculation()
    }

    @objc func sendDataForCalculation() {
        guard let dataType = self.cellDataType, let value = dpiField?.text else {
            return
        }

        if value.count == 0 {
            delegate?.userEndEditingCell(dataType: dataType, value: 0)
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
        guard let dataType = self.cellDataType else {
            return
        }
        delegate?.userResetCellData(dataType: dataType)
    }

    @objc func nextTFResponder(){
        delegate?.nextTFResponder(tag: self.tag, next: true)
    }

    @objc func previewTFResponder(){
        delegate?.nextTFResponder(tag: self.tag, next: false)
    }
}
