//
//  DPIAppLabels.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//
//  ==>  Need to change this file!!  <==
//  ==>        Base concept!!        <==

import Foundation

enum textForEnum:CustomStringConvertible {
    case xPixel
    case yPixel
    case diagonalInInch
    case calculate

    var description: String {
        switch self {
        case .xPixel:
            return "Horizontal number of pixels"
        case .yPixel:
            return "Vertical number of pixels"
        case .diagonalInInch:
            return "Diagonal screen"
        case .calculate:
            return "Calculate"
        }

    }
}

