//
//  UIAppColorSet.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import Colours
import UIKit

enum colorSet {
    case clear
    case white
    case black
    case baseNavigationColor
    case baseBackgroundColor

}

final class UIAppColorSet {
    static func getColor(_ colorSet:colorSet) -> UIColor {
        switch colorSet {
        case .clear:
            return UIColor.clear
        case .white:
            return UIColor.white
        case .black:
            return UIColor.black
        case .baseNavigationColor:
            return UIColor.denim()
        case .baseBackgroundColor:
            return UIColor.pastelBlue()
        }
    }
}

//enum blueColorSet {
//    case robinEgg
//    case pastelBlue
//    case skyBlue
//    case indigo //<- good
//    case denim
//    case blueberry
//    case cornflower
//    case wave
//
//}
