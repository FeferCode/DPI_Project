//
//  Device.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 02/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class Devices{
    static let share = Devices()
    private init() {}

    func getScreenJump() -> Int {
        let screenSize = screenSizeType()

        switch screenSize {
        case ScreenSizeType.iPhone_4_Inch:
            return 215
        case ScreenSizeType.iPhone_4_7_Inch:
            return 150
        case ScreenSizeType.iPhone_5_5_Inch:
            return 100
        case ScreenSizeType.iPhone_5_8_Inch:
            return 100
        default:
            return 15
        }
    }

    func screenSizeType() -> ScreenSizeType {
        let deviceHeight = Int(UIScreen.main.bounds.height)

        switch deviceHeight {
        case 568:
            return ScreenSizeType.iPhone_4_Inch
        case 667:
            return ScreenSizeType.iPhone_4_7_Inch
        case 736:
            return ScreenSizeType.iPhone_5_5_Inch
        case 812:
            return ScreenSizeType.iPhone_5_8_Inch
        case 896:
            return ScreenSizeType.iPhone_6_1_Inch
        default:
            return ScreenSizeType.iPhone_6_5_Inch
        }
    }
}

public enum ScreenSizeType {
    case iPhone_4_Inch
    case iPhone_4_7_Inch
    case iPhone_5_5_Inch
    case iPhone_5_8_Inch
    case iPhone_6_1_Inch
    case iPhone_6_5_Inch
}
