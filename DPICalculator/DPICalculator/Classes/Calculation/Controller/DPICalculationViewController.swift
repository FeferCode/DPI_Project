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
    var tableViewData: [DPIMainTableDataModel]!

    override func viewDidLoad() {
        setupViewsForController()
        self.view = baseView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.generateTestData()
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

    //MARK :- For testing right now
    func createMonitor(){
        let display = ScreenDataBuilder  { builder in
            builder.resolution.x = 3840
            builder.resolution.y = 2160
            builder.screenDiagonalInInch = 27
        }

        if let monitor = ScreenData(builder: display) {
            print(monitor.description)
        }
    }
}


