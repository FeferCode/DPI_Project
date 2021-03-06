//
//  Navigation.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//
//  ==>  Need to change this file!!  <==
//  ==>        Base concept!!        <==

import Foundation
import UIKit

enum viewControllerNavigationEnum {
    case mainViewController
    case saveScreenViewController
    case historyViewController
    case aboutViewController
    case noVC

}

enum navigationIconStyle {
    case dark
    case light
}

final class DPIViewControllers {

    static func getViewController(_ viewController:viewControllerNavigationEnum) -> UIViewController {
        switch viewController {
        case .mainViewController:
            return DPICalculationViewController()
        case .saveScreenViewController:
            return DPISaveScreenViewController()
        case .historyViewController:
            return DPIHistoryViewController()
        case .aboutViewController:
            return DPIAboutViewController()
        case .noVC:
            return NoViewController()
        }
    }
}
