//
//  DPICellDelegate.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation

protocol DPICellDelegate: AnyObject {
    func changeTFResponder(actual:Int, next: DPIResponderDirectionEnum)
    func resetCalculation()
    func hideKeyboard()
    func calculate()
}

enum DPIUserCellDataEnum {
    case xPixels
    case yPixels
    case diagonalInInch
}

enum DPIResponderDirectionEnum {
    case next
    case previous
}
