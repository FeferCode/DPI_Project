//
//  DPICellDelegate.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation

protocol DPICellDelegate: AnyObject {
    func userEndEditingCell(dataType: DPIUserCellDataEnum, value: Float)
    func userResetCellData(dataType: DPIUserCellDataEnum)
    func nextTFResponder(tag:Int, next: Bool)
    func resetCalculation()
    func hideKeyboard()
    func calculate()
}

enum DPIUserCellDataEnum {
    case xPixels
    case yPixels
    case diagonalInInch
}
