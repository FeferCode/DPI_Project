//
//  DPISaveCellDataDelegate.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation

protocol DPISaveCellDataDelegate: AnyObject {
    func changeTFResponder(actual:Int, next: DPIResponderDirectionEnum)
    func resetCalculation()
    func hideKeyboard()
    func save()
}
