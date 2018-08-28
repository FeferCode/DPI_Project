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
    //MARK: - Cells for displaying data from calculations, section 0
    func calculatedDataForCells(){
        guard let data = self.screenData else {
            return
        }

        let resolution = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.resolution)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.resolution.x))x\(String(describing: data.resolution.y))"))

        let ratio = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.ratio)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.ratio.x)):\(String(describing: data.ratio.y))"))

        let aspectRatio = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.aspectRatio)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.aspectRatio))"))

        let pixelsPerInch = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.pixelsPerInch)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.PPI))"))

        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.screenSizeInch)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.screenSizeInInch.x)) x \(String(describing: data.screenSizeInInch.y))"))

        let obj5 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.workspaceInch)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.workSurfaceInInch))"))

        let obj6 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.screenSizeCM)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.screenSizeInCm.x)) x \(String(describing: data.screenSizeInCm.y))"))

        let obj7 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.workspaceCm)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.workSurfaceInCm))"))

        let obj8 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.numberOfPixels)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.numberOfPixels))"))

        let obj9 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForCalculeted(.numberOfMegapixels)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.numberOfMegaPixels))"))

        self.calculetedDataForCell = [resolution, ratio, aspectRatio, pixelsPerInch, obj4, obj5, obj6, obj7, obj8, obj9]
    }
    
    //MARK: - cells for calculations, section 1
    func dataForCalculationsCells(){

        let xPixels = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                            firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              placeholder: String.textForCalculations(.xPixel),
                                                                              dataType: .xPixels))

        let yPixels = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                            firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
                                                                              placeholder: String.textForCalculations(.yPixel),
                                                                              dataType: .yPixels))

        let diagonalInInch = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                                   firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                                                              placeholder: String.textForCalculations(.diagonalInInch),
                                                                              dataType: .diagonalInInch))

        self.cellsDataForCalculation = [xPixels, yPixels, diagonalInInch]
    }
}
