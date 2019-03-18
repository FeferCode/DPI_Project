//
//  DPIHistoryViewController+TableView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension DPIHistoryViewController: UITableViewDelegate, UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.tableData.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableData[indexPath.row]
        return cellForRow(cellData, tableView, indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == newSelectedIndex
        {
            return 155
        } else {
            return 55
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeader(for: tableView, section: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        oldSelectedIndex = newSelectedIndex

        if indexPath.row == newSelectedIndex{
            newSelectedIndex = -1
        } else {
            newSelectedIndex = indexPath.row
        }

        tableView.beginUpdates()
        if oldSelectedIndex != -1 {
            tableView.reloadRows(at: [IndexPath(row: oldSelectedIndex, section: 0), indexPath], with: .automatic)
        } else {
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Delete" , handler: { (action:UITableViewRowAction, indexPath: IndexPath) -> Void in
            let shareMenu = UIAlertController(title: nil, message: "Do you want to delete screen calculations?", preferredStyle: .actionSheet)

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let twitterAction = UIAlertAction(title: "Delete", style: .default, handler: { (alert) in
                CoreDataManager.share.deleteScreenData(screenData: self.tableData[indexPath.row].cellData, completionHandler: { (result) in
                    switch result {
                    case .success():
                        self.tableData.remove(at: indexPath.row)
                        self.animateTable()

                    case .failure( _): break
                    }
                })
            })

            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)

            self.present(shareMenu, animated: true, completion: nil)
        })
        return [shareAction]
    }
}
