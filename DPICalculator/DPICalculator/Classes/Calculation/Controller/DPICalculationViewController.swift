//
//  DPIMainViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPICalculationViewController: DPIBaseViewController, UITextFieldDelegate {

    var viewHeight = 0
    var myTableView: DPIBaseTableView!
    var calculetedDataForCell: [DPIMainTableDataModel] = [DPIMainTableDataModel]() {
        didSet {
            hideKeyboard()
        }
    }
    var cellsDataForCalculation: [DPIMainTableDataModel] = [DPIMainTableDataModel]()

    var dataForCalculation: (x:Int, y:Int, diagonal:Float) = (x: 0, y: 0, diagonal: 0)
    var screenData: ScreenData?

    override func viewDidLoad() {
        setupViewsForController()
        keyboardConfiguration()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return getHeader(for: tableView, section: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 && calculetedDataForCell.count == 0 { return 0 }
        return 40
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.dataForCalculationsCells()
        self.baseView = DPIMainView()
        self.myTableView = (baseView as! DPIMainView).tableView
        self.view = baseView
        setupTableView()
    }

    private func setupTableView(){
        myTableView.register(DPIBaseTableViewHeader.self,
                             forHeaderFooterViewReuseIdentifier: DPIBaseTableViewHeaderFooterEnum.headerView.rawValue)

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
        if Devices.share.screenSizeType() != ScreenSizeType.iPhone_4_Inch {
            myTableView.isScrollEnabled = false
        }
        myTableView.dataSource = self
        myTableView.delegate = self
    }
}
