//
//  CoreDataManager.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 27/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let share = CoreDataManager()

    private init(){}

    func saveScreenData(screenData:ScreenData, completionHandler: @escaping (saveCoreDataResult) -> ()){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName:  "ScreenDataCoreModel", in: managedContext)!
        let screenCoreDataObj = NSManagedObject(entity: entity, insertInto: managedContext)

        if let newData = screenData.date, let newCompany = screenData.company, let newModel = screenData.model, let newYear = screenData.year {
            screenCoreDataObj.setValue(newCompany, forKey: "company")
            screenCoreDataObj.setValue(newModel, forKey: "model")
            screenCoreDataObj.setValue(newYear, forKey: "displayDescription")
            screenCoreDataObj.setValue(newData, forKey: "date")
        }

        screenCoreDataObj.setValue(screenData.screenDiagonalInInch, forKey: "screenDiagonalInInch")
        screenCoreDataObj.setValue(screenData.aspectRatio, forKey: "aspect_ratio")
        screenCoreDataObj.setValue(screenData.numberOfMegaPixels , forKey: "numberOfMegapixels")
        screenCoreDataObj.setValue(screenData.numberOfPixels, forKey: "numberOfPixels")
        screenCoreDataObj.setValue(screenData.PPI, forKey: "ppi")
        screenCoreDataObj.setValue(screenData.ratio.x, forKey: "ratio_x")
        screenCoreDataObj.setValue(screenData.ratio.y, forKey: "ratio_y")
        screenCoreDataObj.setValue(screenData.resolution.x, forKey: "resolution_x")
        screenCoreDataObj.setValue(screenData.resolution.y, forKey: "resolution_y")
        screenCoreDataObj.setValue(screenData.screenSizeInCm.x, forKey: "screenSize_cmX")
        screenCoreDataObj.setValue(screenData.screenSizeInCm.y, forKey: "screenSize_cmY")
        screenCoreDataObj.setValue(screenData.screenSizeInInch.x, forKey: "screenSize_inchX")
        screenCoreDataObj.setValue(screenData.screenSizeInInch.y, forKey: "screenSize_inchY")
        screenCoreDataObj.setValue(screenData.workSurfaceInCm, forKey: "workspace_cm")
        screenCoreDataObj.setValue(screenData.workSurfaceInInch, forKey: "workspace_inch")

        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            completionHandler(.failure(error))
        }
        completionHandler(.success())
    }

    func loadScreenData(completionHandler: @escaping (loadCoreDataResult) -> ()){
        var screenDataTable = [ScreenDataCoreModel]()

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ScreenDataCoreModel")

        //        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
        //        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "email", ascending: false)]

        do {
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                guard let newScreenData = data as? ScreenDataCoreModel else {
                    print("Cannot create ScreenDataCoreModel")
                    continue
                }
                newScreenData.printAllProperties()
                screenDataTable.append(newScreenData)
            }
        } catch {
            print("Failed")
            completionHandler(.failure(error))
        }
        completionHandler(.success(screenDataTable))
    }

    private func deleteScreenData(screenData:ScreenData, completionHandler: @escaping (deleteCoreDataResult) -> ()){

    }

}
