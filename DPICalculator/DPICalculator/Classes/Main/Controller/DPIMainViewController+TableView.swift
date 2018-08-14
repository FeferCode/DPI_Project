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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextLabelCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextLabel
            cell.dpiCellData = cellData
            return cell
        }
    }

    //MARK: - Only for testing
    func generateTestData(){
        let obj1 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withImage,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.aspect_ratio_light),
                                         title: "Raz")
        let obj2 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withLabel,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.width_light),
                                         title: "Dwa")
        let obj3 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withLabel,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.height_light),
                                         title: "Trzy")
        let obj4 = DPIMainTableDataModel(type: DPIBaseTableViewStyleEnum.withButton,
                                         image: UIImage(assetIdentifier: UIImage.AssetIdentifier.calculate_light),
                                         title: "Cztery")
        self.tableViewData = [obj1, obj2, obj3, obj4]
    }
}


