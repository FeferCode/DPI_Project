//
//  DPIMainViewController+TableView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPICalculationViewController: UITableViewDelegate, UITableViewDataSource {

    //MARK: - Headers
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeader(for: tableView, section: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 && calculetedDataForCell.count == 0 { return 0 }
        return 40
    }

    //MARK: - Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return calculetedDataForCell.count
        case 1:
            return cellsDataForCalculation.count
        default:
            return 0
        }

    }

    //MARK: - Cells for rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cellData = calculetedDataForCell[indexPath.row]
            return getCellForRow(cellData, tableView, indexPath)
        } else {
            let cellData = cellsDataForCalculation[indexPath.row]
            return getCellForRow(cellData, tableView, indexPath)
        }


    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

    //MARK: - Animations
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        cell.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        UIView.animate(withDuration: 1.0) {
            cell.transform = CGAffineTransform.identity
        }
    }
}
