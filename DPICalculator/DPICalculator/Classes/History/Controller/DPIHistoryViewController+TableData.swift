//
//  DPIHistoryViewController+TableData.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPIHistoryViewController {
    func prepareDataForTBCells(){
        getHistoryData()
    }

    private func getHistoryData(){
        CoreDataManager.share.loadScreenData { result in
            switch result {
            case .success(let coreData):
                for data in coreData {
                    data.printAllProperties()
                }
                self.prepairDataForCells(coreData)
            case .failure(let error):
                self.showAllert(error: error)
            }
        }
    }

    private func prepairDataForCells(_ coreData: [ScreenDataCoreModel]){
        if self.tableData.count > 0 {
            self.tableData.removeAll()
        }
        for data in coreData {
            let screenData = DPIHistoryTableDataModel(cellType: .withFourLabels, cellData: data, cellState: .close, cellImage: UIImageManager.shared.getImage(.screen))
            self.tableData.append(screenData)
        }
        self.myTableView.reloadData()
    }

    private func showAllert(error:Error){
        print(error)
    }
}
