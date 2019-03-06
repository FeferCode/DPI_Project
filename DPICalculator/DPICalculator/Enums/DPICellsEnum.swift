//
//  DPIBaseTableViewStyleEnum.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation

enum DPIBaseTableViewCellStyleEnum:String {
    case withLabel = "withLabel"
    case withTwoLabels = "withTwoLabels"
    case withTwoTextFields = "withTwoTextFields"
    case withTextField = "withTextField"
}

enum DPIHistoryTableViewCellStyleEnum:String {
    case withFourLabels = "withFourLabels"
}

enum DPIBaseTableViewHeaderFooterEnum:String {
    case headerView = "headerView"
    case footerView = "footerView"
}

enum DPIHistoryCellState {
    case open
    case close
}
