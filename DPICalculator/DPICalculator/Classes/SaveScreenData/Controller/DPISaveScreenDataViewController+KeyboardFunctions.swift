//
//  DPISaveScreenDataViewController+KeyboardFunctions.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPISaveScreenViewController: DPISaveCellDataDelegate {

    //MARK :- Hide Keyboard
    func keyboardConfiguration(){
    }

    func hideKeyboard(){
        self.view.endEditing(true)
    }

    func changeTFResponder(actual: Int, next: DPIResponderDirectionEnum){
        var nextFisrtResponder = actual

        if next == .next {
            nextFisrtResponder += 1
        } else if next == .previous {
            nextFisrtResponder -= 1
        }

        if (nextFisrtResponder < 0 && next == .previous) || (nextFisrtResponder > 2 && next == .next) {
            return
        }

        let cell = self.myTableView.cellForRow(at: IndexPath(row: nextFisrtResponder, section: 0)) as! DPISaveDataTableViewCellWithLabelAndTextField
        cell.dpiField?.becomeFirstResponder()
    }

    func resetCalculation() {
        print("reset")
    }

    func save() {
        print("save")
    }
}
