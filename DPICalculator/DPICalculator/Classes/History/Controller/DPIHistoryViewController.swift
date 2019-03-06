//
//  DPIHistoryViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//


import UIKit

class DPIHistoryViewController: DPIBaseViewController, UITextFieldDelegate, UITabBarDelegate {

    var myTableView: DPIBaseTableView!
    var tableData = [DPIHistoryTableDataModel]()
    var viewHeight = 0

    override func viewDidLoad() {
        setupViewsForController()
        prepareDataForTBCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
        self.animateTable()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.baseView = DPIHistoryView()
        self.myTableView = (baseView as! DPIHistoryView).tableView
        self.view = baseView
        registerTableViewCells()
    }

    private func registerTableViewCells(){
        myTableView.register(DPIBaseTableViewHeader.self,
                             forHeaderFooterViewReuseIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue)
        myTableView.register(DPIBaseTableViewCellWittFourLabels.self,
                             forCellReuseIdentifier: DPIHistoryTableViewCellStyleEnum.withFourLabels.rawValue)

        myTableView.allowsSelection = false
        myTableView.separatorInset = UIEdgeInsets.zero
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
