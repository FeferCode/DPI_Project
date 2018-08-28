//
//  DPIMainViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPICalculationViewController: DPIBaseViewController {

    var myTableView: DPIBaseTableView!
    var calculetedDataForCell: [DPIMainTableDataModel] = [DPIMainTableDataModel]()
    var cellsDataForCalculation: [DPIMainTableDataModel] = [DPIMainTableDataModel]()

    var dataForCalculation: (x:Int, y:Int, diagonal:Float) = (x: 0, y: 0, diagonal: 0)
    var screenData: ScreenData?

    override func viewDidLoad() {
        setupViewsForController()
        self.view = baseView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let header = UIView()
            let label = UILabel()
            label.text = "wtf"
            header.addSubview(label)
            header.backgroundColor = UIColor.red
            return header
        }
        return nil
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.dataForCalculationsCells()
        self.baseView = DPIMainView()
        self.myTableView = (baseView as! DPIMainView).tableView
        setupTableView()
    }

    private func setupTableView(){
        myTableView.register(DPIBaseTableViewCellWithTextField.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTextField.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTwoTextFields.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTwoTextFields.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTextLabel.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withLabel.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTwoTextLabels.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTwoLabels.rawValue)

        myTableView.allowsSelection = false
        myTableView.separatorInset = UIEdgeInsets.zero
        myTableView.isScrollEnabled = false
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
