//
//  ViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 08.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit
//import ChameleonFramework

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().barTintColor = UIAppColorSet.getColor(.tomato)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func pushViewController(_ viewController: viewControllerNavigation, title: String, animated: Bool) {
        let newViewController = DPIViewControllers.getViewController(viewController)
        super.pushViewController(newViewController, animated: true)
        self.navigationItem.title = title
    }

    func setupNextNavigationButtons(for next: String){
        let nextViewController = UIBarButtonItem(title: next, style: .plain, target: self, action: #selector(nextViewControllerAction))
        navigationItem.rightBarButtonItem = nextViewController
    }

    @objc private func nextViewControllerAction(){
        let nextViewController = ExampleViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
