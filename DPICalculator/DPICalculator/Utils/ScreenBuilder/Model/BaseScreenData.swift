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
