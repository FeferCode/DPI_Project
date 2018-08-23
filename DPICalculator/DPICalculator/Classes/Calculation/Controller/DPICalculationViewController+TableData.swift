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

        self.tableViewData = [obj1, obj2, obj3]
    }

//    func generateTestData(){
//        let obj0 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withImage,
//                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
//                                                                              text: nil,
//                                                                              placeholder: nil,
//                                                                              dataType: nil))
//
//        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
//                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
//                                                                              text: nil,
//                                                                              placeholder: textForEnum.xPixel.description,
//                                                                              dataType: nil))
//
//        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
//                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
//                                                                              text: nil,
//                                                                              placeholder: textForEnum.xPixel.description,
//                                                                              dataType: nil))
//
//        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
//                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
//                                                                              text: nil,
//                                                                              placeholder: textForEnum.xPixel.description,
//                                                                              dataType: nil))
//
//        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoTextFields,
//                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
//                                                                              text: nil,
//                                                                              placeholder: textForEnum.yPixel.description,
//                                                                              dataType: nil),
//                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
//                                                                               text: nil,
//                                                                               placeholder: textForEnum.yPixel.description,
//                                                                               dataType: nil))
//
//        let obj5 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withButton,
//                                         firstData: DPIMainTableCellDataModel(image: nil,
//                                                                              text: textForEnum.calculate.description,
//                                                                              placeholder: nil,
//                                                                              dataType: nil))
//
//        self.tableViewData = [obj0, obj1, obj2, obj3, obj4, obj5]
//    }
}
