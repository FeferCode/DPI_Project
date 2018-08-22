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
    func generateTestData(){
        let obj0 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withImage,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                                                              text: nil,
                                                                              placeholder: nil))

        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.xPixel.description))
        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.xPixel.description))
        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.xPixel.description))

        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoTextFields,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.yPixel.description),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
                                                                               text: nil,
                                                                               placeholder: textForEnum.yPixel.description))

        let obj5 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withButton,
                                         firstData: DPIMainTableCellDataModel(image: nil,
                                                                              text: textForEnum.calculate.description,
                                                                              placeholder: nil))

        self.tableViewData = [obj0, obj1, obj2, obj3, obj4, obj5]
    }
}
