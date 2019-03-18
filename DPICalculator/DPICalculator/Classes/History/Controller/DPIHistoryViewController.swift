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
    var newSelectedIndex : NSInteger! = -1
    var oldSelectedIndex : NSInteger! = -1

    convenience init() {
        self.init(nibName:nil, bundle:nil)
        self.title = String.textForViewControllerTitle(.historyVC)
        setTabBarItem()
        siriActivityHistory()
    }

    override func viewDidLoad() {
        setupViewsForController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
        self.prepareDataForTBCells()
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

    func setTabBarItem(){
        let image = UIImageManager.shared.getImage(.calendar)
        self.tabBarItem = UITabBarItem(title: String.textForViewControllerTitle(.historyVC), image: image, tag: 1)
    }

    func siriActivityHistory(){
        let siriActivity = NSUserActivity(activityType: "pl.fefercode.dpi.history")
        siriActivity.title = "Show History"
        siriActivity.isEligibleForSearch = true
        siriActivity.isEligibleForPrediction = true

        self.userActivity = siriActivity
        self.userActivity?.becomeCurrent()
    }
}
