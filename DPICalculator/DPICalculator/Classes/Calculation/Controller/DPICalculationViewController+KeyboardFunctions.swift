//
//  DPICalculationViewController+KeyboardFunctions.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 02/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPICalculationViewController {
    //MARK :- Hide Keyboard
    func keyboardConfiguration(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil);
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        let screenJump = CGFloat(Devices.share.getScreenJump())
        if self.calculetedDataForCell.count == 0 {
            return
        } else if self.calculetedDataForCell.count != 0 && self.viewHeight == 0 {
            self.myTableView.frame.origin.y -= screenJump
            self.viewHeight -= Int(screenJump)
        }
    }

    @objc func keyboardWillHide(sender: NSNotification) {
        let screenJump = CGFloat(Devices.share.getScreenJump())
        if (self.calculetedDataForCell.count != 0 && self.viewHeight == -Int(screenJump)) || (self.calculetedDataForCell.count == 0 && self.viewHeight == -Int(screenJump)){
            self.myTableView.frame.origin.y += screenJump
            self.viewHeight += Int(screenJump)
            return
        } else if (self.calculetedDataForCell.count != 0 && self.viewHeight == Int(screenJump)) || (self.calculetedDataForCell.count == 0 && self.viewHeight == Int(screenJump)){
            self.myTableView.frame.origin.y -= screenJump
            self.viewHeight -= Int(screenJump)
            return
        } else if self.calculetedDataForCell.count != 0 {
            return
        }
    }

    func hideKeyboard(){
        self.view.endEditing(true)
    }

    func resetViewJump(){
        let screenJump = CGFloat(Devices.share.getScreenJump())
        if (self.calculetedDataForCell.count != 0 && self.viewHeight == -Int(screenJump)) || (self.calculetedDataForCell.count == 0 && self.viewHeight == -Int(screenJump)){
            self.myTableView.frame.origin.y += screenJump
            self.viewHeight += Int(screenJump)
        }
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

        let cell = self.myTableView.cellForRow(at: IndexPath(row: nextFisrtResponder, section: 1)) as! DPIBaseTableViewCellWithTextField
        cell.dpiField?.becomeFirstResponder()
    }
}
