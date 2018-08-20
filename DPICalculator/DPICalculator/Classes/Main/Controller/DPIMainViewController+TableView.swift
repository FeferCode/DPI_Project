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
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewStyleEnum.withButton.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithButton
            cell.setupCellData(cellData)
            return cell
        case .withTextField:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewStyleEnum.withTextField.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextField
            cell.setupCellData(cellData)
            return cell
        case .withTwoTextFields:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewStyleEnum.withTwoTextFields.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTwoTextFields
            cell.setupCellData(cellData)
            return cell
        case .withLabel:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewStyleEnum.withLabel.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextLabel
            cell.setupCellData(cellData)
            return cell
        case .withImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: DPIBaseTableViewStyleEnum.withImage.rawValue, for: indexPath as IndexPath) as! DPIBaseTableViewCellWithImageView
            cell.setupCellData(cellData)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ((tableView.cellForRow(at: indexPath) as? DPIBaseTableViewCellWithButton) != nil) {
            return 60
        }
        return 30
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: 2.0) {
            cell.transform = CGAffineTransform.identity
        }
    }
}
