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
            cell.setupCellData(cellData)
            return cell
        case .withTextField:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextField
            cell.setupCellData(cellData)
            return cell
        case .withLabel:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextLabelCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextLabel
            cell.setupCellData(cellData)
            return cell
        case .withImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithImageView
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

}
