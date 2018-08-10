//
//  Navigation.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

enum viewControllerNavigation {
    case main
    case example
}

enum navigationIconStyle {
    case dark
    case light
}

class DPIViewControllers {

    static func getViewController(_ viewController:viewControllerNavigation) -> UIViewController {
        switch viewController {
        case .main:
            return MainViewController()
        case .example:
            return ExampleViewController()
        }
        return NoViewController()
    }
}
