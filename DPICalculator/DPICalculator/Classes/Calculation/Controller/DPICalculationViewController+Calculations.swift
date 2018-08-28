//
//  DPICalculationViewController+Calculations.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 23.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation

extension DPICalculationViewController: DPICellDelegate {

    //MARK: - event from cell
    func userEndEditingCell(dataType: DPIUserCellDataEnum, value: Float) {

        switch dataType {
        case .xPixels:
            dataForCalculation.x = Int(value)
        case .yPixels:
            dataForCalculation.y = Int(value)
        case .diagonalInInch:
            dataForCalculation.diagonal = value
        }
        self.calculate()
        self.calculatedDataForCells()

        self.myTableView.reloadSections([0], with: .middle)
    }


    //MARK :- For testing right now
    private func calculate(){
        guard dataForCalculation.x != 0,
            dataForCalculation.y != 0,
            dataForCalculation.diagonal != 0 else { return }

        guard let baseScreenData = createMonitor(x: dataForCalculation.x,
                                                 y: dataForCalculation.y,
                                                 diagonal: dataForCalculation.diagonal) else { return }

        let screenData = CalculationManager().calculateAllData(ForScreen: baseScreenData)
        screenData.printAllProperties()
        self.screenData = screenData

    }

    private func createMonitor(x:Int, y:Int, diagonal:Float) -> BaseScreenData?{
        let display = BaseScreenDataBuilder  { builder in
            builder.resolution.x = x
            builder.resolution.y = y
            builder.screenDiagonalInInch = diagonal
        }

        if let monitor = BaseScreenData(builder: display) {
            return monitor
        }
        return nil
    }

    func resetCalculation() {
        self.calculetedDataForCell.removeAll()

//        self.myTableView.performBatchUpdates(<#T##updates: (() -> Void)?##(() -> Void)?##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        self.myTableView.reloadSections([0], with: .middle)
    }
}
