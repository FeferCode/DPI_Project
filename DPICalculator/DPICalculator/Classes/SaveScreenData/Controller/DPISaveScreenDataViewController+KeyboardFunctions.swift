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
        print("Save")
        self.prepairDataForSave()
        self.hideKeyboard()
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }

    private func prepairDataForSave(){

    }

    private func saveData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName:  "ScreenDataModel", in: managedContext)!
        let screen = NSManagedObject(entity: entity, insertInto: managedContext)

//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "aspect_ratio")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "company")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "model")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "numberOfMegapixels")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "numberOfPixels")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "ppi")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "ratio")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "resolution")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "screenSize_cm")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "screenSize_inch")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "workspace_cm")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "workspace_inch")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "year")
//        screen.setValue(<#T##value: Any?##Any?#>, forKey: "date")

        do {
            try managedContext.save()
            self.navigationController?.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }












}
