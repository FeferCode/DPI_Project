//
//  DPICalculationViewController+SaveButton.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 07/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPICalculationViewController {
    func setNavigationBarItem(){
        let item = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        self.navigationItem.setRightBarButton(item, animated: true)
    }

    @objc private func saveData(){
        self.saveScreenData()
    }

    private func saveScreenData(){
        guard let navigationVC = self.navigationController as? BaseNavigationController else {
            return
        }

        if self.calculetedDataForCell.count == 0 && self.screenData == nil {
            print("No data for save")
            return
        }

        if let newViewController = DPIViewControllers.getViewController(.saveScreenViewController) as? DPISaveScreenViewController {
            newViewController.calculetedDataForCell = self.calculetedDataForCell
            newViewController.screenData = self.screenData
            newViewController.navigationItem.title = String.textForViewControllerTitle(.saveDataVC)
            navigationVC.pushViewController(newViewController, animated: true)
        }
    }
}
