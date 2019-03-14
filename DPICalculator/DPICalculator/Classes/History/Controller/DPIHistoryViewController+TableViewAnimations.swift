//
//  DPIHistoryViewController+TableViewActions.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 06/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPIHistoryViewController {
    func animateTable() {
        self.myTableView.reloadData()

        let cells = myTableView.visibleCells
        let tableHeight: CGFloat = myTableView.bounds.size.height
        //        let tableWidth: CGFloat = myTableView.bounds.size.width

        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }

        var index = 0

        for a in cells {
            self.myTableView.isHidden = false
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromTop, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)

            index += 1
        }
    }
}
