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
    func generateDataForCells(){
        guard let data = self.screenData else {
            return
        }

        let obj0 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Resolution: ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.resolution.x))x\(String(describing: data.resolution.y))",
                                                                               placeholder: nil,
                                                                               dataType: nil))

        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Ratio: ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.ratio.x)):\(String(describing: data.ratio.y))",
                                                                               placeholder: nil,
                                                                               dataType: nil))

        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Aspect ratio: ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.aspectRatio))",
                                                                               placeholder: nil,
                                                                               dataType: nil))

        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Pixels per inch: ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.PPI))",
                                                                               placeholder: nil,
                                                                               dataType: nil))

        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Screen size (inch): ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.screenSizeInInch.x))x\(String(describing: data.screenSizeInInch.y))",
                                                                               placeholder: nil,
                                                                               dataType: nil))
        let obj5 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Workspace (inch): ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.workSurfaceInInch))",
                                                                               placeholder: nil,
                                                                               dataType: nil))

        let obj6 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Screen size (cm): ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.screenSizeInCm.x))x\(String(describing: data.screenSizeInCm.y))",
                                                                               placeholder: nil,
                                                                               dataType: nil))
        let obj7 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Workspace (cm): ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.workSurfaceInCm))",
                                                                               placeholder: nil,
                                                                               dataType: nil))
        let obj8 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Number of pixels: ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.numberOfPixels))",
                                                                               placeholder: nil,
                                                                               dataType: nil))
        let obj9 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTwoLabels,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: "Number of megapixels: ",
                                                                              placeholder: nil,
                                                                              dataType: nil),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: "\(String(describing: data.numberOfMegaPixels))",
                                                                               placeholder: nil,
                                                                               dataType: nil))


        self.calculetedDataForCell = [obj0, obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8, obj9]
    }
    
    //MARK: - cells for calculations, section 1
    func generateDataForCalculationsCells(){

        let obj0 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.xPixel.description,
                                                                              dataType: .xPixels))

        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.yPixel.description,
                                                                              dataType: .yPixels))

        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_dark),
                                                                              text: nil,
                                                                              placeholder: textForEnum.diagonalInInch.description,
                                                                              dataType: .diagonalInInch))

        self.cellsDataForCalculation = [obj0, obj1, obj2]
    }
}
