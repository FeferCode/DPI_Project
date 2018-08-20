//
//  BaseButton.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class BaseButton: UIButton {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 14
        self.layer.maskedCorners = [.layerMinXMinYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMinXMaxYCorner,
                                    .layerMaxXMaxYCorner]
        self.clipsToBounds = true
        self.layer.borderColor = UIAppColorSet.getColor(.white).cgColor
        self.layer.borderWidth = 1
    }


}
