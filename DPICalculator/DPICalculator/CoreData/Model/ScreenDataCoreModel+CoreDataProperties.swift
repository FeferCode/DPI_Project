//
//  ScreenDataCoreModel+CoreDataProperties.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 04/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//
//

import Foundation
import CoreData


extension ScreenDataCoreModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ScreenDataCoreModel> {
        return NSFetchRequest<ScreenDataCoreModel>(entityName: "ScreenDataCoreModel")
    }

    @NSManaged public var aspect_ratio: Float
    @NSManaged public var company: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var displayDescription: String?
    @NSManaged public var model: String?
    @NSManaged public var numberOfMegapixels: Float
    @NSManaged public var numberOfPixels: Int64
    @NSManaged public var ppi: Float
    @NSManaged public var ratio_x: Int64
    @NSManaged public var ratio_y: Int64
    @NSManaged public var resolution_x: Int64
    @NSManaged public var resolution_y: Int64
    @NSManaged public var screenDiagonalInInch: Float
    @NSManaged public var screenSize_cmX: Float
    @NSManaged public var screenSize_cmY: Float
    @NSManaged public var screenSize_inchX: Float
    @NSManaged public var screenSize_inchY: Float
    @NSManaged public var workspace_cm: Float
    @NSManaged public var workspace_inch: Float

}
