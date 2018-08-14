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
    case noVC
}

enum exampleViewControllerNavigationEnum {
    case firstVC
    case secondVC
}

enum navigationIconStyle {
    case dark
    case light
}

final class DPIViewControllers {

    static func getViewController(_ viewController:viewControllerNavigationEnum) -> UIViewController {
        switch viewController {
        case .mainViewController:
            return DPIMainViewController()
        case .noVC:
            return NoViewController()
        }
    }

    static func getExampleViewController(_ viewController:exampleViewControllerNavigationEnum) -> UIViewController {
        switch viewController {
        case .firstVC:
            return FirstExampleViewController()
        case .secondVC:
            return SecondExampleViewController()
        }
    }
}