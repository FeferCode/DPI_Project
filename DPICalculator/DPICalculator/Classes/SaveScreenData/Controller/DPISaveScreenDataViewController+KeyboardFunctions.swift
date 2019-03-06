//
//  DPISaveScreenDataViewController+KeyboardFunctions.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension DPISaveScreenViewController: DPISaveCellDataDelegate {

    //MARK :- Hide Keyboard
    func keyboardConfiguration(){
    }

    func hideKeyboard(){
        self.view.endEditing(true)
    }

    func changeTFResponder(actual: Int, next: DPIResponderDirectionEnum){
        var nextFisrtResponder = actual

        if next == .next {
            nextFisrtResponder += 1
        } else if next == .previous {
            nextFisrtResponder -= 1
        }

        if (nextFisrtResponder < 0 && next == .previous) || (nextFisrtResponder > 2 && next == .next) {
            return
        }

        let cell = self.myTableView.cellForRow(at: IndexPath(row: nextFisrtResponder, section: 0)) as! DPISaveDataTableViewCellWithLabelAndTextField
        cell.dpiField?.becomeFirstResponder()
    }

    func resetCalculation() {
        print("reset")
    }

    func save() {
        print("Save Button")
        self.prepairDataForSave()
        self.hideKeyboard()
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }

    private func prepairDataForSave(){
        var model:String = ""
        var company:String = ""
        var displayDescription:String = ""

        for n in 0...2 {
            if let cell = self.myTableView.cellForRow(at: IndexPath(row: n, section: 0)) as? DPISaveDataTableViewCellWithLabelAndTextField {
                if let text = cell.dpiField?.text {
                    switch n {
                    case 0:
                        model = text
                    case 1:
                        company = text
                    case 2:
                        displayDescription = text
                    default:
                        print("No more data")
                    }
                }
            }
        }
        guard self.screenData != nil else {
            return
        }
        self.screenData?.setDisplayData(year: displayDescription, model: model, company: company)
        self.saveData()
    }

    private func saveData(){
        guard let data = self.screenData else {
            print("Could not save")
            return
        }

        CoreDataManager.share.saveScreenData(screenData: data) { result in
            switch result {
            case .success():
                self.navigationController?.dismiss(animated: true, completion: nil)

            case .failure(let error):
                self.showAllert(error: error)
            }
        }
    }

    private func showAllert(error:Error){
        print(error)
    }
}
