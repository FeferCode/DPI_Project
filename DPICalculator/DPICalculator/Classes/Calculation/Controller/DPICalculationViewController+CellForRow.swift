//
//  DPIMainViewController+CellForRow.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 21.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPICalculationViewController {
    func getCellForRow(_ cellData: DPIMainTableDataModel, _ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        switch cellData.cellType {
        case .withTextField:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewCellStyleEnum.withTextField.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextField
            cell.setupCellData(cellData)
            cell.delegate = self
            return cell
        case .withTwoTextFields:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewCellStyleEnum.withTwoTextFields.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTwoTextFields
            cell.setupCellData(cellData)
            return cell
        case .withLabel:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewCellStyleEnum.withLabel.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextLabel
            cell.setupCellData(cellData)
            return cell
        case .withTwoLabels:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewCellStyleEnum.withTwoLabels.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTwoTextLabels
            cell.setupCellData(cellData)
            return cell
        }
    }
}
