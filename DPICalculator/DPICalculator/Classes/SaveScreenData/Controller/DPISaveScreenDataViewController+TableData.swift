//
//  DPISaveScreenDataViewController+TableData.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPISaveScreenViewController {
    func prepareDataForTBCells(){

        let model = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                               firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                    text: String.textForSaveViewController(.model)),
                                               secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                     text: nil,
                                                                                     cellTag: 0))

        let company = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                         firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                              text: String.textForSaveViewController(.company)),
                                         secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: nil,
                                                                               cellTag: 1))

        let year = DPIMainTableDataModel(type: DPIBaseTableViewCellStyleEnum.withTextField,
                                          firstData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                               text: String.textForSaveViewController(.year)),
                                          secondData: DPIMainTableCellDataModel(image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_dark),
                                                                                text: nil,
                                                                                cellTag: 2))

        self.calculetedDataForCell.insert(year, at: 0)
        self.calculetedDataForCell.insert(company, at: 0)
        self.calculetedDataForCell.insert(model, at: 0)
    }

    func prepareDataForSave(){
        print("SaveData")
    }
}

