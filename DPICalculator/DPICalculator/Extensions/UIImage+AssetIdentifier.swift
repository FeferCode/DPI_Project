//
//  UIImage+AssetIdentifier.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    enum AssetIdentifier:String {
        case aspect_ratio_dark = "aspect_ratio_dark"
        case aspect_ratio_light = "aspect_ratio_light"
        case calculate_dark = "calculate_dark"
        case calculate_light = "calculate_light"
        case height_dark = "height_dark"
        case height_light = "height_light"
        case width_dark = "width_dark"
        case width_light = "width_light"

        static let values = [aspect_ratio_dark,
                             aspect_ratio_light,
                             calculate_dark,
                             calculate_light,
                             height_dark,
                             height_light,
                             width_dark,
                             width_light]
    }

    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
