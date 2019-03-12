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
    func prepareDataForTBCells(){
        guard let data = self.screenData else {
            return
        }

        let resolution = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                               firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.diagonal),
                                                                                    text: String.textForCalculeted(.resolution)),
                                               secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                     text: "\(String(describing: data.resolution.x))x\(String(describing: data.resolution.y))"))

        let ratio = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                          firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                               text: String.textForCalculeted(.ratio)),
                                          secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                text: "\(String(describing: data.ratio.x)):\(String(describing: data.ratio.y))"))

        let aspectRatio = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                     text: String.textForCalculeted(.aspectRatio)),
                                                secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                      text: "\(String(describing: data.aspectRatio))"))

        let pixelsPerInch = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                  firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                       text: String.textForCalculeted(.pixelsPerInch)),
                                                  secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                        text: "\(String(describing: data.PPI))"))

        let screenSizeInInch = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                     firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                          text: String.textForCalculeted(.screenSizeInch)),
                                                     secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                           text: "\(String(describing: data.screenSizeInInch.x)) x \(String(describing: data.screenSizeInInch.y))"))

        let workSurfaceInInch = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                      firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                           text: String.textForCalculeted(.workspaceInch)),
                                                      secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                            text: "\(String(describing: data.workSurfaceInInch))"))

        let screenSizeInCm = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                   firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                        text: String.textForCalculeted(.screenSizeCM)),
                                                   secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                         text: "\(String(describing: data.screenSizeInCm.x)) x \(String(describing: data.screenSizeInCm.y))"))

        let workSurfaceInCm = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                    firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                         text: String.textForCalculeted(.workspaceCm)),
                                                    secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                          text: "\(String(describing: data.workSurfaceInCm))"))

        let numberOfPixels = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                   firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                        text: String.textForCalculeted(.numberOfPixels)),
                                                   secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                         text: "\(String(describing: data.numberOfPixels))"))

        let numberOfMegaPixels = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                                       firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.arrowRight),
                                                                                            text: String.textForCalculeted(.numberOfMegapixels)),
                                                       secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                             text: "\(String(describing: data.numberOfMegaPixels))"))

        self.calculetedDataForCell = [resolution, ratio, aspectRatio, pixelsPerInch, screenSizeInInch, workSurfaceInInch, screenSizeInCm, workSurfaceInCm, numberOfPixels, numberOfMegaPixels]
    }

    //MARK: - cells for calculations, section 1
    func dataForCalculationsCells(){

        let xPixels = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                            firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.width),
                                                                                 placeholder: String.textForCalculations(.xPixel),
                                                                                 dataType: .xPixels,
                                                                                 cellTag: 0))

        let yPixels = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                            firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.height),
                                                                                 placeholder: String.textForCalculations(.yPixel),
                                                                                 dataType: .yPixels,
                                                                                 cellTag: 1))

        let diagonalInInch = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                                   firstData: DPIMainTableCellDataModel(image: UIImageManager.shared.getImage(.diagonal),
                                                                                        placeholder: String.textForCalculations(.diagonalInInch),
                                                                                        dataType: .diagonalInInch,
                                                                                        cellTag: 2))

        self.cellsDataForCalculation = [xPixels, yPixels, diagonalInInch]
    }
}
