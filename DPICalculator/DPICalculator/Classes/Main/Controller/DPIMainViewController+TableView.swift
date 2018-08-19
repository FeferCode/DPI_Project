//
//  DPIMainViewController+TableView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPIMainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableViewData[indexPath.row]
        switch cellData.cellType {
        case .withButton:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithButton
            cell.dpiCellData = cellData
            return cell
        case .withTextField:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextField
            cell.dpiCellData = cellData
            return cell
        case .withLabel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextLabelCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextLabel
            cell.dpiCellData = cellData
            return cell
        case .withImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithImageView
            cell.dpiCellData = cellData
            return cell
        }
    }

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


//        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withLabel,
//                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_light),
//                                         title: textForEnum.calculate.description)
//        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withLabel,
//                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_light),
//                                         title: textForEnum.calculate.description)
//        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withButton,
//                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.calculate_light),
//                                         title: textForEnum.calculate.description)
//        let obj5 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withButton,
//                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.calculate_light),
//                                         title: textForEnum.calculate.description)

//        self.tableViewData = [obj0, obj1, obj2, obj3, obj4, obj5]
        self.tableViewData = [obj0, obj1, obj2, obj3, obj4]
    }
}


