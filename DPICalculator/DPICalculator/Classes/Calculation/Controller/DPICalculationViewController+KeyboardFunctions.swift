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
            self.view.frame.origin.y -= screenJump
            self.viewHeight -= Int(screenJump)
        }
    }

    @objc func keyboardWillHide(sender: NSNotification) {
        let screenJump = CGFloat(Devices.share.getScreenJump())
        if (self.calculetedDataForCell.count != 0 && self.viewHeight == -Int(screenJump)) || (self.calculetedDataForCell.count == 0 && self.viewHeight == -Int(screenJump)){
            self.view.frame.origin.y += screenJump
            self.viewHeight += Int(screenJump)
            return
        } else if (self.calculetedDataForCell.count != 0 && self.viewHeight == Int(screenJump)) || (self.calculetedDataForCell.count == 0 && self.viewHeight == Int(screenJump)){
            self.view.frame.origin.y -= screenJump
            self.viewHeight -= Int(screenJump)
            return
        } else if self.calculetedDataForCell.count != 0 {
            return
        }

    }

    func hideKeyboard(){
        self.view.endEditing(true)
    }
}
