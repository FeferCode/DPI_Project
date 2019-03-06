//
//  DPIHistoryViewController+CellForRow.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 06/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPIHistoryViewController {
    func cellForRow(_ cellData: DPIHistoryTableDataModel, _ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        switch cellData.cellType {
        case .withFourLabels:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIHistoryTableViewCellStyleEnum.withFourLabels.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWittFourLabels
            cell.setupCellData(cellData)
            return cell
        }
    }

    func getHeader(for tableView:UITableView, section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue) as!DPIBaseTableViewHeader? else { return nil }
        header.setupHeaderView("History")
        return header
    }
}
