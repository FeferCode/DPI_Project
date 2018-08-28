//
//  DPICalculationViewController+SectionHeader.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 28.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPICalculationViewController {

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
