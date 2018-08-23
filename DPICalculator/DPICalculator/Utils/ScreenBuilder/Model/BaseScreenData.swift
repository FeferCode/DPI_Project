//
//  ScreenData.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.02.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation


struct BaseScreenData: CustomStringConvertible {
    
    public private(set) var resolution: (x:Int,y:Int)
    public private(set) var screenDiagonalInInch:Float
    public private(set) var data:Date
    
    init?(builder: BaseScreenDataBuilder){
        if let x = builder.resolution.x, let y = builder.resolution.y, let diagonal = builder.screenDiagonalInInch {
            resolution.x = x
            resolution.y = y
            screenDiagonalInInch = diagonal
            data = Date()
        } else {
            return nil
        }
    }
    var description:String {
        return "Resolution: \(resolution.x)x\(resolution.y) with \(screenDiagonalInInch)\""
    }
}


//internal class ScreenData {
//    private(set) var id: Int = 0
//    private(set) var company:String = ""
//    private(set) var model:String = ""
//    private(set) var year: Int = 0
//    private(set) var date: Date = Date()
//
//    private(set) var resolution: (x:Int,y:Int) = (0,0)
//    private(set) var screenDiagonalInInch:Float = 0
//    private(set) var ratio: (x: Int, y: Int) = (0,0)
//    private(set) var aspectRatio: (x: Float, y: Float) = (0,0)
//
//    private(set) var screenSizeInCm:(x:Float,y:Float) = (0,0)
//    private(set) var screenSizeInInch:(x:Float,y:Float) = (0,0)
//
//    private(set) var workSurfaceInCm:Float = 0
//    private(set) var workSurfaceInInch:Float = 0
//
//    private(set) var numberOfPixels:Int = 0
//    private(set) var numberOfMegaPixels:Float = 0
//    private(set) var PPI:Float = 0
//
//
//
//    func printTypesOfProperties(){
//        print("=========================")
//        print("ID: \(self.id)")
//        print("Create date: \(self.date)")
//        print("Company: \(self.company)")
//        print("Model: \(self.model)")
//        print("Year of production: \(self.year)")
//        print("Screen size: \(self.screenDiagonalInInch) inch")
//        print("Resolution: \(self.resolution.x) : \(self.resolution.y)")
//        print("Ratio\(self.ratio)")
//        print("Aspect ratio: \(self.aspectRatio.x):\(self.aspectRatio.y)")
//        print("Screen size (cm): \(self.screenSizeInCm.x) : \(self.screenSizeInCm.y)")
//        print("Work surface (cm):\(self.workSurfaceInCm)")
//        print("Screen size (inch): \(self.screenSizeInInch.x) : \(self.screenSizeInInch.y)")
//        print("Work surface (inch): \(self.workSurfaceInInch)")
//        print("Number of pixels: \(self.numberOfPixels)")
//        print("Number of megapiksels: \(self.numberOfMegaPixels) Mpix")
//        print("Screen PPI: \(self.PPI)")
//        print()
//    }
//}

