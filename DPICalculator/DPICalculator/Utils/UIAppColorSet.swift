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

final class UIAppColorSet {
    static func getColor(_ colorSet:colorSet) -> UIColor {
        switch colorSet {
        case .clear:
            return UIColor.clear
        case .white:
            return UIColor.white
        case .watermelon:
            return UIColor.watermelon()
        case .tomato:
            return UIColor.tomato()
        case .grapefruit:
            return UIColor.grapefruit()
        case .strawberry:
            return UIColor.strawberry()
        }
    }
}

enum colorSet {
    case clear
    case white
    case watermelon
    case tomato
    case grapefruit
    case strawberry
}
