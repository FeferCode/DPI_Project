//
//  ScreenDataBuilder.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.02.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation

class ScreenDataBuilder {
    
    var resolution: (x:Int?,y:Int?)
    var screenDiagonalInInch:Float?
    
    typealias BuilderClosure = (ScreenDataBuilder) -> ()
    
    init(builder: BuilderClosure) {
        builder(self)
    }
}
