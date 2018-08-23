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
    public private(set) var cellType: DPIBaseTableViewCellStyleEnum
    public private(set) var first: DPIMainTableCellDataModel? = nil
    public private(set) var second: DPIMainTableCellDataModel? = nil

    init(type: DPIBaseTableViewCellStyleEnum, firstData:DPIMainTableCellDataModel){
        self.cellType = type
        self.first = firstData
    }

    init(type: DPIBaseTableViewCellStyleEnum, firstData:DPIMainTableCellDataModel, secondData: DPIMainTableCellDataModel){
        self.cellType = type
        self.first = firstData
        self.second = secondData
    }
}

struct DPIMainTableCellDataModel {
    let cellImage: UIImage?
    let cellText: String?
    let cellTextPlaceholder: String?
    let cellDataType:DPIUserCellDataEnum?

    init(image: UIImage?, text: String?, placeholder:String?, dataType: DPIUserCellDataEnum?){
        self.cellImage = image
        self.cellText = text
        self.cellTextPlaceholder = placeholder
        self.cellDataType = dataType
    }
}
