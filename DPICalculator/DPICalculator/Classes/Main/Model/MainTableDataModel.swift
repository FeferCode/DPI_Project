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
    let cellText: String?
    let cellTextPlaceholder: String?

    init(type: DPIBaseTableViewStyleEnum, image: UIImage?, text: String?, placeholder:String?){
        self.cellType = type
        self.cellImage = image
        self.cellText = text
        self.cellTextPlaceholder = placeholder
    }
}


