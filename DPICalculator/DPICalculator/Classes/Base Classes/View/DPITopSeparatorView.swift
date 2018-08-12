//
//  DPITopSeparatorView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPITopSeparatorView: UIView {

    var dpiBackgroundColor: UIColor?

    override func draw(_ rect: CGRect) {
        self.backgroundColor = UIAppColorSet.getColor(.white)
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.clipsToBounds = true
    }
}
