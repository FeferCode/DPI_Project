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
    var calculationsDataForCell: [DPIMainTableDataModel] = [DPIMainTableDataModel]()
    var dataForCalculation: (x:Int, y:Int, diagonal:Float) = (x: 0, y: 0, diagonal: 0)

    override func viewDidLoad() {
        setupViewsForController()
        self.view = baseView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.generateCalculationsCells()
        self.baseView = DPIMainView()
        self.myTableView = (baseView as! DPIMainView).tableView
        setupTableView()
    }

    private func setupTableView(){
        myTableView.register(DPIBaseTableViewCellWithButton.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withButton.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTextField.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTextField.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTwoTextFields.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTwoTextFields.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTextLabel.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withLabel.rawValue)
        myTableView.register(DPIBaseTableViewCellWithImageView.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withImage.rawValue)

        myTableView.allowsSelection = false
        myTableView.separatorInset = UIEdgeInsets.zero
        myTableView.isScrollEnabled = false
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
