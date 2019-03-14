//
//  HistoryTableDataModel.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

struct DPIHistoryTableDataModel {
    public private(set) var cellType: DPIHistoryTableViewCellStyleEnum
    public private(set) var cellState: DPIHistoryCellState
    public private(set) var cellData: ScreenDataCoreModel
    public private(set) var cellImage: UIImage?

    init(cellType:DPIHistoryTableViewCellStyleEnum, cellData:ScreenDataCoreModel, cellState:DPIHistoryCellState, cellImage:UIImage?){
        self.cellData = cellData
        self.cellType = cellType
        self.cellState = cellState
        if let image = cellImage {
            self.cellImage = image
        }
    }

    init(cellType:DPIHistoryTableViewCellStyleEnum, cellData:ScreenDataCoreModel, cellState:DPIHistoryCellState){
        self.cellData = cellData
        self.cellType = cellType
        self.cellState = cellState
    }

    mutating func changeCellState(to state:DPIHistoryCellState){
        self.cellState = state
    }
}
