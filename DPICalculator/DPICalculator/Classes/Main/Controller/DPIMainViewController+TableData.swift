//
//  DPIMainViewController+TableData.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPIMainViewController {
    //MARK: - Only for testing
    func generateTestData(){
        let obj0 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withImage,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                         text: textForEnum.calculate.description,
                                         placeholder: nil)

        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withTextField,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                         text: nil,
                                         placeholder: textForEnum.xPixel.description)

        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withTextField,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
                                         text: nil,
                                         placeholder: textForEnum.yPixel.description)

        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withTextField,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                         text: nil,
                                         placeholder: textForEnum.diagonalInInch.description)

        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withButton,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.calculate_light),
                                         text: textForEnum.calculate.description,
                                         placeholder: nil)

        self.tableViewData = [obj0, obj1, obj2, obj3, obj4]
    }
}
