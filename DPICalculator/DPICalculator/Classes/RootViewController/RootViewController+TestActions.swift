//
//  RootViewController+Actions.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//  public, internal, private, fileprivate

import Foundation
import UIKit

internal extension RootViewController {

    func showExampleViewControllerTest(){
        let newViewController = ExampleViewController()
        newViewController.updateViewConstraints()
        let navigation = UINavigationController(rootViewController: newViewController)
        let topViewController = getMostTopViewController()
        topViewController?.present(navigation, animated: true, completion: nil)
    }

    private func getMostTopViewController() -> UIViewController? {
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            return topViewController
        }
        return nil
    }

}
