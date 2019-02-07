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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
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

    func nextTFResponder(tag: Int, next: Bool){
        var nextFisrtResponder = tag

        if next {
            nextFisrtResponder += 1
        } else {
            nextFisrtResponder -= 1
        }

        if (nextFisrtResponder < 0 && next == false) || (nextFisrtResponder > 2 && next == true) {
            return
        }

        let cell = self.myTableView.cellForRow(at: IndexPath(row: nextFisrtResponder, section: 1)) as! DPIBaseTableViewCellWithTextField
        cell.dpiField?.becomeFirstResponder()
    }

    func badHideKeyboard(_ newValue: (x:Int, y:Int, diagonal:Float)) {
        let screenJump = Devices.share.getScreenJump()

        if (newValue.x == 0 || newValue.y == 0 || newValue.diagonal == 0) && self.viewHeight == -screenJump {
            print("\n\n\nBad Value\n\n\n")
            self.myTableView.frame.origin.y += CGFloat(screenJump)
            self.viewHeight -= screenJump
        }
    }
}
