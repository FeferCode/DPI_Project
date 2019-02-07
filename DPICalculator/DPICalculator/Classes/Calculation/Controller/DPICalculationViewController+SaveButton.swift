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
        saveAlert()
    }

    private func saveAlert(){
        let alertController = UIAlertController(title: "Save screen data", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Save", style: .default) { (_) in
            if let txtField = alertController.textFields?.first, let text = txtField.text {
                if let data = self.screenData {
                    data.printAllProperties()
                }
                print("Text==>" + text)
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alertController.addTextField { (textField) in
            textField.placeholder = "Screen name"
        }
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
