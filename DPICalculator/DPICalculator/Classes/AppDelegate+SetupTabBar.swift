//
//  AppDelegate+Setup.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit
import FontAwesome_swift

extension AppDelegate {
    func setupTabBarViewControllers() -> [UIViewController]{
        let arrayOfViewControllers  = [DPICalculationViewController(),
                                       DPIHistoryViewController(),
                                       NoViewController()]
        return arrayOfViewControllers
    }
}
