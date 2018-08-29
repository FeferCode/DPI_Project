//
//  DPIBaseCollectionView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 29.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 36
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,
                                    .layerMaxXMinYCorner,
                                    .layerMinXMaxYCorner,
                                    .layerMinXMinYCorner]
        self.clipsToBounds = true
        self.layer.borderColor = UIAppColorSet.getColor(.white).cgColor
        self.layer.borderWidth = 1
    }

}
