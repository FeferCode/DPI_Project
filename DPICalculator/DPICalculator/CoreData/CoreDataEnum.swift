//
//  CoreDataEnum.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 04/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation

enum saveCoreDataResult {
    case success()
    case failure(Error)
}

enum loadCoreDataResult {
    case success([ScreenDataCoreModel])
    case failure(Error)
}

enum deleteCoreDataResult {
    case success()
    case failure(Error)
}

enum coreDataEntityNameEnum:String {
    case screenCoreData = "ScreenDataCoreModel"
}
