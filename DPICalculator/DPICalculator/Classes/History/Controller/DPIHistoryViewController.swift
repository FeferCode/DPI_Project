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
    var selectedIndex : NSInteger! = -1

    override func viewDidLoad() {
        setupViewsForController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
        prepareDataForTBCells()
    }

    override func viewDidAppear(_ animated: Bool) {
        self.animateTable()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.baseView = DPIHistoryView()
        self.myTableView = (baseView as! DPIHistoryView).tableView
        self.view = baseView
        self.registerTableViewCells()
    }

    private func registerTableViewCells(){
        myTableView.register(DPIBaseTableViewHeader.self,
                             forHeaderFooterViewReuseIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue)
        myTableView.register(DPIBaseTableViewCellWittFourLabels.self,
                             forCellReuseIdentifier: DPIHistoryTableViewCellStyleEnum.withFourLabels.rawValue)

        myTableView.separatorInset = UIEdgeInsets.zero
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
