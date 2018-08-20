//
//  DPIBaseContainerView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseContainerView: UIView {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 40
        self.layer.maskedCorners = [.layerMinXMinYCorner,
                                    .layerMaxXMaxYCorner]
        self.clipsToBounds = true
    }


}
