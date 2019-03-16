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
        self.layer.cornerRadius = 36
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMinXMaxYCorner,
                                    .layerMinXMinYCorner]
        self.clipsToBounds = true
        self.layer.borderColor = UIAppColorSet.shared.getColor(.white).cgColor
        self.layer.borderWidth = 1
    }
}
