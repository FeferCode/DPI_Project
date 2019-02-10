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
    public private(set) var cellImage: UIImage? = nil
    public private(set) var cellText: String?  = nil
    public private(set) var cellTextPlaceholder: String?  = nil
    public private(set) var cellDataType:DPIUserCellDataEnum?  = nil
    public private(set) var cellTag:Int = 0

    init(text: String?){
        self.cellText = text
    }

    init(image: UIImage?, text: String?){
        self.cellImage = image
        self.cellText = text
    }

    init(text: String?, dataType: DPIUserCellDataEnum?){
        self.cellText = text
        self.cellDataType = dataType
    }

    init(image: UIImage?, text: String?, dataType: DPIUserCellDataEnum?){
        self.cellImage = image
        self.cellText = text
        self.cellDataType = dataType
    }
    init(image: UIImage?, text: String?, cellTag:Int){
        self.cellImage = image
        self.cellText = text
        self.cellTag = cellTag
    }

    init(image: UIImage?, placeholder:String?, dataType: DPIUserCellDataEnum?){
        self.cellImage = image
        self.cellTextPlaceholder = placeholder
        self.cellDataType = dataType
    }

    init(image: UIImage?, text: String?, placeholder:String?, dataType: DPIUserCellDataEnum?){
        self.cellImage = image
        self.cellText = text
        self.cellTextPlaceholder = placeholder
        self.cellDataType = dataType
    }

    init(image: UIImage?, placeholder:String?, dataType: DPIUserCellDataEnum?, cellTag: Int){
        self.cellImage = image
        self.cellTextPlaceholder = placeholder
        self.cellDataType = dataType
        self.cellTag = cellTag
    }
}
