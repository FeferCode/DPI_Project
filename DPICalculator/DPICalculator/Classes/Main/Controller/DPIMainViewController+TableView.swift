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
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithButton
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextField
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextLabelCell", for: indexPath as IndexPath) as! DPIBaseTableViewCellWithTextLabel
            return cell
        }
    }

    func provideCell(for row: Int) -> UITableViewCell {
        
    }
}


