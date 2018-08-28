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

extension String {
    static func textForCalculations(_ text: textForCalculationsEnum) -> String{
        return text.description
    }

    static func textForCalculeted(_ text: textForCalculatedDataEnum) -> String{
        return text.description
    }
}

enum textForCalculationsEnum:CustomStringConvertible {
    case xPixel
    case yPixel
    case diagonalInInch

    var description: String {
        switch self {
        case .xPixel:
            return "Horizontal number of pixels"
        case .yPixel:
            return "Vertical number of pixels"
        case .diagonalInInch:
            return "Diagonal screen"
        }
    }
}

enum textForCalculatedDataEnum:CustomStringConvertible {
    case resolution
    case ratio
    case aspectRatio
    case pixelsPerInch
    case screenSizeCM
    case screenSizeInch
    case workspaceCm
    case workspaceInch
    case numberOfPixels
    case numberOfMegapixels

    var description: String {
        switch self {
        case .resolution:
            return "Resolution: "
        case .ratio:
            return "Ratio: "
        case .aspectRatio:
            return "Aspect ratio: "
        case .pixelsPerInch:
            return "Pixels per inch: "
        case .screenSizeCM:
            return "Screen size (cm): "
        case .screenSizeInch:
            return "Screen size (inch): "
        case .workspaceCm:
            return "Workspace (cm): "
        case .workspaceInch:
            return "Workspace (inch): "
        case .numberOfPixels:
            return "Number of pixels: "
        case .numberOfMegapixels:
            return "Number of megapixels: "
        }
    }
}
