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

    func getMostTopViewController() -> UIViewController? {
        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            return topViewController
        }
        return nil
    }

}
