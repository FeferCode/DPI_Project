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
        var model:String = ""
        var company:String = ""
        var year:String = ""

        for n in 0...2 {
            if let cell = self.myTableView.cellForRow(at: IndexPath(row: n, section: 0)) as? DPISaveDataTableViewCellWithLabelAndTextField {
                if let text = cell.dpiField?.text {
                    switch n {
                    case 0:
                        model = text
                    case 1:
                        company = text
                    case 2:
                        year = text
                    default:
                        print("No more data")
                    }
                }
            }
        }
        guard self.screenData != nil else {
            return
        }
        self.screenData?.setDisplayData(year: year, model: model, company: company)
        self.screenData?.printAllProperties()
        self.saveData()

        self.loadData()
    }

    private func saveData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName:  "ScreenDataModel", in: managedContext)!
        let screen = NSManagedObject(entity: entity, insertInto: managedContext)

        guard let data = self.screenData else {
            print("Could not save")
            return
        }
        if let newData = data.date, let newCompany = data.company, let newModel = data.model, let newYear = data.year {
            screen.setValue(newCompany, forKey: "company")
            screen.setValue(newModel, forKey: "model")
            screen.setValue(newYear, forKey: "year")
            screen.setValue(newData, forKey: "date")
        }

        screen.setValue(data.aspectRatio, forKey: "aspect_ratio")
        screen.setValue(data.numberOfMegaPixels , forKey: "numberOfMegapixels")
        screen.setValue(data.numberOfPixels, forKey: "numberOfPixels")
        screen.setValue(data.PPI, forKey: "ppi")
        screen.setValue(data.ratio.x, forKey: "ratio_x")
        screen.setValue(data.ratio.y, forKey: "ratio_y")
        screen.setValue(data.resolution.x, forKey: "resolution_x")
        screen.setValue(data.resolution.y, forKey: "resolution_y")
        screen.setValue(data.screenSizeInCm.x, forKey: "screenSize_cmX")
        screen.setValue(data.screenSizeInCm.y, forKey: "screenSize_cmY")
        screen.setValue(data.screenSizeInInch.x, forKey: "screenSize_inchX")
        screen.setValue(data.screenSizeInInch.y, forKey: "screenSize_inchY")
        screen.setValue(data.workSurfaceInCm, forKey: "workspace_cm")
        screen.setValue(data.workSurfaceInInch, forKey: "workspace_inch")

        do {
            try managedContext.save()
            self.navigationController?.dismiss(animated: true, completion: nil)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

    private func loadData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ScreenDataModel")

        //        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
        //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]

        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "company") as! String)
                print(data.value(forKey: "model") as! String)
                print(data.value(forKey: "year") as! String)
                print(data.value(forKey: "date") as! Date)
                print(data.value(forKey: "aspect_ratio") as! Float)
                print(data.value(forKey: "numberOfMegapixels") as! Float)
                print(data.value(forKey: "numberOfPixels") as! Int)
                print(data.value(forKey: "ppi") as! Float)
                print(data.value(forKey: "ratio_x") as! Int)
                print(data.value(forKey: "ratio_y") as! Int)
                print(data.value(forKey: "resolution_x") as! Int)
                print(data.value(forKey: "resolution_y") as! Int)
                print(data.value(forKey: "screenSize_cmX") as! Float)
                print(data.value(forKey: "screenSize_cmY") as! Float)
                print(data.value(forKey: "screenSize_inchX") as! Float)
                print(data.value(forKey: "screenSize_inchY") as! Float)
                print(data.value(forKey: "workspace_cm") as! Float)
                print(data.value(forKey: "workspace_inch") as! Float)
            }

        } catch {
            print("Failed")
        }
    }












}
