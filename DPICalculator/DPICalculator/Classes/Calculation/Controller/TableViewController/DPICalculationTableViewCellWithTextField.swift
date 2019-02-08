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

    @objc func calculateData(){
        delegate?.calculate()
    }

    @objc func hideKeyboard(){
        delegate?.hideKeyboard()
    }

    @objc func deleteTextFieldData(){
        self.dpiField?.text?.removeAll()
    }

    @objc func previewTFResponder(){
        delegate?.changeTFResponder(actual: self.tag, next: .previous)
    }

    @objc func nextTFResponder(){
        delegate?.changeTFResponder(actual: self.tag, next: .next)
    }
}
