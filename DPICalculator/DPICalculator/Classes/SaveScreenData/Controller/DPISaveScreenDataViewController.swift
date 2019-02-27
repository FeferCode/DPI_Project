//
//  DPISaveScreenData.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPISaveScreenViewController: DPIBaseViewController, UITextFieldDelegate, UITabBarDelegate {

    var viewHeight = 0
    var myTableView: DPIBaseTableView!
    var calculetedDataForCell: [DPIMainTableDataModel] = [DPIMainTableDataModel]()
    var screenData: ScreenData?

    override func viewDidLoad() {
        setupViewsForController()
        prepareDataForTBCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
        self.myTableView.reloadData()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.baseView = DPISaveScreenDataView()
        self.myTableView = (baseView as! DPISaveScreenDataView).tableView
        self.view = baseView
        self.registerTableViewCells()
    }

    private func registerTableViewCells(){
        myTableView.register(DPIBaseTableViewHeader.self,
                             forHeaderFooterViewReuseIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue)
        myTableView.register(DPISaveDataTableViewCellWithLabelAndTextField.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTextField.rawValue)
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


