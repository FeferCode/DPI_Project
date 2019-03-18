//
//  DPICalculationViewController+Calculations.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 23.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

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

    }

    func calculate() {
        self.getDataForCalculation()
        if self.calculateData() {
            self.prepareDataForTBCells()
            self.myTableView.reloadSections([0], with: .middle)
            self.hideKeyboard()
        } else {
            self.resetCalculation()
            self.resetViewJump()
        }
    }

    private func getDataForCalculation(){
        if let cellX = self.myTableView.cellForRow(at: IndexPath(row: 0, section: 1)) as? DPICalculationTableViewCellWithTextField {
            guard let x = Int((cellX.dpiField?.text ?? "0")) else {
                resetCalculation()
                return
            }
            self.dataForCalculation.x = x
        }

        if let cellY = self.myTableView.cellForRow(at: IndexPath(row: 1, section: 1)) as? DPICalculationTableViewCellWithTextField {
            guard let y = Int((cellY.dpiField?.text ?? "0")) else {
                resetCalculation()
                return
            }
            self.dataForCalculation.y = y
        }

        if let cellD = self.myTableView.cellForRow(at: IndexPath(row: 2, section: 1)) as? DPICalculationTableViewCellWithTextField {
            guard let d = Float((cellD.dpiField?.text ?? "0")) else {
                resetCalculation()
                return
            }
            self.dataForCalculation.diagonal = d
        }
    }

    private func calculateData() -> Bool {
        guard dataForCalculation.x != 0,
            dataForCalculation.y != 0,
            dataForCalculation.diagonal != 0 else {
                self.alertActionNoDataForCalculation()
                return false }

        guard let baseScreenData = createMonitor(x: dataForCalculation.x,
                                                 y: dataForCalculation.y,
                                                 diagonal: dataForCalculation.diagonal) else { return false }

        let screenData = CalculationManager().calculateAllData(ForScreen: baseScreenData)
        screenData.printAllProperties()
        self.screenData = screenData
        return true
    }

    private func createMonitor(x:Int, y:Int, diagonal:Float) -> BaseScreenData? {
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
        self.screenData = nil
        self.dataForCalculation = (x: 0, y: 0, diagonal: 0)
        self.calculetedDataForCell.removeAll()
        self.myTableView.reloadSections([0], with: .middle)
    }

    private func alertActionNoDataForCalculation(){
        let alertController = UIAlertController(title: "Error", message: "No data for calculation", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))


        self.present(alertController, animated: true, completion: nil)
    }
}
