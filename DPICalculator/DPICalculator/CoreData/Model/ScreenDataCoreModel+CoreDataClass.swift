//
//  ScreenDataCoreModel+CoreDataClass.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 04/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//
//

import Foundation
import CoreData

//@objc(ScreenDataCoreModel)
public class ScreenDataCoreModel: NSManagedObject {

    func printAllProperties(){
            print("=============ScreenDataCoreModel=============")
            print("Company: \(String(describing: self.company))")
            print("Model: \(String(describing: self.model))")
            print("Description: \(String(describing: self.displayDescription))")
            print("Date: \(String(describing: self.date))")
            print("Screen size: \(self.screenDiagonalInInch) inch")
            print("Resolution: \(self.resolution_x) : \(self.resolution_y)")
            print("Ratio: \(self.ratio_x) : \(self.ratio_y)")
            print("Aspect ratio: \(self.aspect_ratio)")
            print("Screen size (cm): \(self.screenSize_cmX) : \(self.screenSize_cmY)")
            print("Work surface (cm): \(self.workspace_cm)")
            print("Screen size (inch): \(self.screenSize_inchX) : \(self.screenSize_inchY)")
            print("Work surface (inch): \(self.workspace_inch)")
            print("Number of pixels: \(self.numberOfPixels)")
            print("Number of megapiksels: \(self.numberOfMegapixels) Mpix")
            print("Screen PPI: \(self.ppi)")
            print("=============================================")
    }
}
