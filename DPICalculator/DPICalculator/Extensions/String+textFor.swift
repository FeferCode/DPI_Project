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

    static func textForViewControllerTitle(_ text: textTitleForViewController) -> String{
        return text.description
    }

    static func textForSaveViewController(_ text: textForSaveViewController) -> String{
        return text.description
    }
    static func textForAboutViewController(_ text: textForAboutApp) -> String{
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

enum textTitleForViewController: String {
    case dpiTitle
    case calulationVC
    case historyVC
    case aboutVC
    case saveDataVC
    case noViewController

    var description: String {
        switch self {
        case .dpiTitle:
            return "DPI Calculator"
        case .aboutVC:
            return "About"
        case .calulationVC:
            return "Calculation"
        case .historyVC:
            return "History"
        case .saveDataVC:
            return "Save Data"
        case .noViewController:
            return "NoVC"
        }
    }
}

enum textForSaveViewController: String {
    case company
    case model
    case screenDescription

    var description: String {
        switch self {
        case .company:
            return "Company"
        case .model:
            return "Model"
        case .screenDescription:
            return "Description"
        }
    }
}

enum textForAboutApp: String {
    case title
    case abutoText
    case buttonText

    var description: String {
        switch self {
        case .title:
            return "About App"
        case .abutoText:
            return "About text"
        case .buttonText:
            return "Open WWW"
        }
    }
}
