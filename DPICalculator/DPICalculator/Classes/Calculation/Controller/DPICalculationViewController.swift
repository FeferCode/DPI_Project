//
//  DPIMainViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPICalculationViewController: DPIBaseViewController, UITextFieldDelegate, UITabBarDelegate {

    var viewHeight = 0
    var myTableView: DPIBaseTableView!
    var calculetedDataForCell: [DPIMainTableDataModel] = [DPIMainTableDataModel]()
    var cellsDataForCalculation: [DPIMainTableDataModel] = [DPIMainTableDataModel]()
    var dataForCalculation: (x:Int, y:Int, diagonal:Float) = (x: 0, y: 0, diagonal: 0) 
    var screenData: ScreenData?

    convenience init() {
        self.init(nibName:nil, bundle:nil)
        setTabBarItem()
    }

    override func viewDidLoad() {
        setupViewsForController()
        keyboardConfiguration()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
        setNavigationBarItem()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.dataForCalculationsCells()
        self.baseView = DPIMainView()
        self.myTableView = (baseView as! DPIMainView).tableView
        self.view = baseView
        registerTableViewCells()
        setNavigationBarItem()
    }

    private func registerTableViewCells(){
        myTableView.register(DPIBaseTableViewHeader.self,
                             forHeaderFooterViewReuseIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue)
        myTableView.register(DPICalculationTableViewCellWithTextField.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTextField.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTextLabel.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withLabel.rawValue)
        myTableView.register(DPIBaseTableViewCellWithTwoTextLabels.self,
                             forCellReuseIdentifier: DPIBaseTableViewCellStyleEnum.withTwoLabels.rawValue)

        myTableView.allowsSelection = false
        myTableView.separatorInset = UIEdgeInsets.zero
        if Devices.share.screenSizeType() != ScreenSizeType.iPhone_4_Inch {
            myTableView.isScrollEnabled = false
        }
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
