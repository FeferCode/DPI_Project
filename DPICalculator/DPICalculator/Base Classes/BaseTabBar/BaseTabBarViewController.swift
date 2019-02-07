//
//  DPITabBarViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = UIAppColorSet.getColor(.white)
        UITabBar.appearance().barTintColor = UIAppColorSet.getColor(.baseNavigationColor)
        UITabBar.appearance().tintColor = UIAppColorSet.getColor(.white)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barStyle = .default
        self.title = "DPI Calculator"
        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let vc = self.selectedViewController {
            self.navigationItem.rightBarButtonItem = vc.navigationItem.rightBarButtonItem
        }
    }

    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem
    }
}
