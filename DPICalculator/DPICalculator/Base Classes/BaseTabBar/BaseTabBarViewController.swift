//
//  DPITabBarViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().backgroundColor = UIAppColorSet.getColor(.white)
        UITabBar.appearance().barTintColor = UIAppColorSet.getColor(.watermelon)
        UITabBar.appearance().tintColor = UIAppColorSet.getColor(.white)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barStyle = .default
        self.title = "DPI Calculator"
    }
}
