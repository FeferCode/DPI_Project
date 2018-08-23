//
//  DPIMainViewController+TableData.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPICalculationViewController {
    //MARK: - Only for testing
    func generateCalculetedCells(){

    }

    func generateCalculationsCells(){

        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.xPixel.description,
                                                                              dataType: .xPixels))

        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.yPixel.description,
                                                                              dataType: .yPixels))

        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.diagonalInInch.description,
                                                                              dataType: .diagonalInInch))

        self.calculationsDataForCell = [obj1, obj2, obj3]
    }
}
