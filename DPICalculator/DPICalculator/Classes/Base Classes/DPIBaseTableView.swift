//
//  DPIBaseTableView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableView: UITableView {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 25
//        self.layer.maskedCorners = [.layerMinXMaxYCorner,
//                                    .layerMaxXMinYCorner]

        self.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                    .layerMinXMaxYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMinXMinYCorner]
        self.clipsToBounds = true
    }
}
