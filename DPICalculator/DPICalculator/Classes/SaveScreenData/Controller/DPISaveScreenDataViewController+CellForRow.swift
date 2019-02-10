//
//  DPISaveScreenDataViewController+CellForRow.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPISaveScreenViewController {
    func cellForRow(_ cellData: DPIMainTableDataModel, _ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        switch cellData.cellType {
        case .withTextField:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewCellStyleEnum.withTextField.rawValue, for: indexPath as IndexPath) as! DPISaveDataTableViewCellWithLabelAndTextField
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

    func getHeader(for tableView:UITableView, section: Int) -> UIView? {
        if section == 0 && calculetedDataForCell.count == 0 {
            return nil
        } else if section == 0 && calculetedDataForCell.count > 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue) as! DPIBaseTableViewHeader? else { return nil }
            header.setupHeaderView("Your screen data")
            return header
        } else if section == 1 && calculetedDataForCell.count == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue) as! DPIBaseTableViewHeader? else { return nil }
            header.setupHeaderView("Type data")
            return header
        } else if section == 1 && calculetedDataForCell.count > 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue) as! DPIBaseTableViewHeader? else { return nil }
            header.setupHeaderView("Omg")
            return header
        }
        return nil
    }
}
