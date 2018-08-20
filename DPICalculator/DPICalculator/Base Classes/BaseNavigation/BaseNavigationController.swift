//
//  ViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 08.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().backgroundColor = UIAppColorSet.getColor(.clear)
        UINavigationBar.appearance().barTintColor = UIAppColorSet.getColor(.baseNavigationColor)
        UINavigationBar.appearance().tintColor = UIAppColorSet.getColor(.white)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                                            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 24)]
        UINavigationBar.appearance().isOpaque = false
        UINavigationBar.appearance().barStyle = .default

    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func pushViewController(_ viewController: viewControllerNavigationEnum, title: String, animated: Bool) {
        let newViewController = DPIViewControllers.getViewController(viewController)
        super.pushViewController(newViewController, animated: true)
        self.navigationItem.title = title
        self.tabBarController?.navigationController?.title = title
    }
}
