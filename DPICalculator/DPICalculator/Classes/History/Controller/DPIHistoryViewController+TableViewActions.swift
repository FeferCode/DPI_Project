//
//  DPIHistoryViewController+TableViewActions.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 06/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation

extension DPIHistoryViewController {
    func siriTest(){
        let siriActivity = NSUserActivity(activityType: "pl.fefercode.dpi.history")
        siriActivity.title = "Show History"
        siriActivity.isEligibleForSearch = true
        siriActivity.isEligibleForPrediction = true

        self.userActivity = siriActivity
        self.userActivity?.becomeCurrent()
    }
}
