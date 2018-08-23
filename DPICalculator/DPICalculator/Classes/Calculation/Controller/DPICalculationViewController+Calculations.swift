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
    }


    //MARK :- For testing right now
    private func calculate(){
        if dataForCalculation.x != 0, dataForCalculation.y != 0, dataForCalculation.diagonal != 0 {

            createMonitor(x: dataForCalculation.x,
                          y: dataForCalculation.y,
                          diagonal: dataForCalculation.diagonal)
        }
    }

    private func createMonitor(x:Int, y:Int, diagonal:Float){
        let display = ScreenDataBuilder  { builder in
            builder.resolution.x = x
            builder.resolution.y = y
            builder.screenDiagonalInInch = diagonal
        }

        if let monitor = ScreenData(builder: display) {
            print(monitor.description)
        }
    }
}
