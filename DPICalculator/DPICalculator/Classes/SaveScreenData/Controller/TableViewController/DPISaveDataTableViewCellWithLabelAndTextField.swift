//
//  DPISaveDataTableViewCellWithTextField.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPISaveDataTableViewCellWithLabelAndTextField: DPIBaseTableViewCellWithLabelAndTextFields {
    weak var delegate: DPISaveCellDataDelegate?

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        addButtons()
        changeView()

    }


    //MARK :- Button configuration
    private func addButtons(){
        let bar = UIToolbar()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let back = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(previewTFResponder))
        let reset = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(deleteTextFieldData))
        let hide = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(hideKeyboard))
        let save = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveData))
        let next = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextTFResponder))
        bar.items = [back, flexibleSpace, reset, flexibleSpace, save, flexibleSpace, hide, flexibleSpace, next]
        bar.sizeToFit()
        dpiField?.inputAccessoryView = bar
    }

    @objc func saveData(){
        delegate?.save()
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

    private func changeView(){
        
    }
}
