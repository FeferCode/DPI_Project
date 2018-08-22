//
//  AppDelegate+Setup.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit
import Font_Awesome_Swift

extension AppDelegate {
    func setupTabBarViewControllers() -> [UIViewController]{
        let arrayOfViewControllers  = [DPICalculationViewController(),
                                       NoViewController(),
                                       NoViewController()]
        return arrayOfViewControllers
    }

    func customiseTabItems(tabBar: UITabBar) {

        var itemsTitle:[String] = ["Calculator", "History", "About"]
        var itemsImage:[FAType] = [.FACalculator, .FACalendar, .FASafari]

        for i in 0...2 {
            let item = tabBar.items![i]
            item.title = itemsTitle[i]
            item.setFAIcon(icon: itemsImage[i])

        }
    }
}
