//
//  MainTableDataModel.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

struct DPIMainTableDataModel {
    let cellType: DPIBaseTableViewStyleEnum
    let cellImage: UIImage?
    let cellTitle: String?
//    let cellPlaceholder: String?

    init(type: DPIBaseTableViewStyleEnum, image: UIImage, title: String){
        self.cellType = type
        self.cellImage = image
        self.cellTitle = title
    }
}


