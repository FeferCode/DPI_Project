//
//  ViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 08.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func pushViewController(_ viewController: viewControllerNavigation, title: String, animated: Bool) {
        let newViewController = DPIViewControllers.getViewController(viewController)
        super.pushViewController(newViewController, animated: true)
        self.navigationItem.title = title
    }

    func setupNextNavigationButtons(for next: String){
        let nextViewController = UIBarButtonItem(title: next, style: .plain, target: self, action: #selector(nextViewControllerAction))
        navigationItem.rightBarButtonItem = nextViewController
//        self.navigationBar.barT
    }

    @objc private func nextViewControllerAction(){
        let nextViewController = ExampleViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
