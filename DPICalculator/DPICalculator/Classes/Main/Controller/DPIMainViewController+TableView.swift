//
//  DPIMainViewController+TableView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension DPIMainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath as IndexPath) as! DPIBaseTableViewCell
        setupCell(cell)
        return cell
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Row number: \(indexPath.row)")
    }

    func setupCell(_ cell: DPIBaseTableViewCell){
        if let label = cell.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            label.text = textForEnum.calculate.description
        }

        if let field = cell.dpiField {
            field.textColor = UIAppColorSet.getColor(.white)
            field.backgroundColor = UIAppColorSet.getColor(.clear)
            field.text = textForEnum.calculate.description
        }

        if let button = cell.dpiButton {
            button.tintColor = UIAppColorSet.getColor(.white)
            button.backgroundColor = UIAppColorSet.getColor(.clear)
            button.setTitle(textForEnum.calculate.description, for: .normal)
        }
    }
}
