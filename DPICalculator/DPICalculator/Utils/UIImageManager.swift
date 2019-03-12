//
//  UIImageManager.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

final class UIImageManager {
    static let shared = UIImageManager()
    private init(){}

    func getImage(_ image:DPImage) -> UIImage {
        switch image {
        case .calculator:
            return UIImage.fontAwesomeIcon(name: .calculator, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        case .calendar:
            return UIImage.fontAwesomeIcon(name: .calendar, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        case .about:
            return UIImage.fontAwesomeIcon(name: .info, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        case .save:
            return UIImage.fontAwesomeIcon(name: .plusCircle, style: .solid, textColor: .white, size: CGSize(width: 30, height: 30))
        case .back:
            return UIImage.fontAwesomeIcon(name: .arrowCircleLeft, style: .solid, textColor: .white, size: CGSize(width: 30, height: 30))
        case .next:
            return UIImage.fontAwesomeIcon(name: .arrowCircleRight, style: .solid, textColor: .white, size: CGSize(width: 30, height: 30))
        default:
            return UIImage.fontAwesomeIcon(name: .democrat, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        }
    }

    func getImage(_ image:DPICellImageEnum) -> UIImage {
        switch image {
        case .width:
            return UIImage.fontAwesomeIcon(name: .arrowsAltH, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        case .height:
            return UIImage.fontAwesomeIcon(name: .arrowsAltV, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        case .diagonal:
            return UIImage.fontAwesomeIcon(name: .expandArrowsAlt, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        default:
            return UIImage.fontAwesomeIcon(name: .democrat, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        }
    }
}

enum DPImage {
    case calculator
    case calendar
    case history
    case about
    case save
    case back
    case next

    case noImage
}

enum DPICellImageEnum {
    case width
    case height
    case diagonal

    case noCellImage
}
