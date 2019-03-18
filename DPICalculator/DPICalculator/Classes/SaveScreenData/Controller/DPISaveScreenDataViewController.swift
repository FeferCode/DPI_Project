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
    var dataSaved:Bool = false

    override func viewDidLoad() {
        setupViewsForController()
        prepareDataForTBCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
        self.myTableView.reloadData()
        setupBackButton()
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

    func setupBackButton(){
        self.navigationItem.hidesBackButton = true
        let backButton = UIBarButtonItem(image: UIImageManager.shared.getImage(.back), style: .done, target: self, action: #selector(self.backButtonAction(sender:)))
        self.navigationItem.leftBarButtonItem = backButton
    }

    @objc func backButtonAction(sender: UIBarButtonItem){
        if dataSaved == false {
            showPopUp()
        }
    }

    func showPopUp(){
        let alertController = UIAlertController(title: "Alert", message: "Would you go back to calculation without saving?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue editing", style: .default))
        alertController.addAction(UIAlertAction(title: "Back without saving", style: .cancel, handler: { (alert) in
            _ = self.navigationController?.popViewController(animated: true)
        }))

        let imgViewTitle = UIImageView(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        imgViewTitle.image = UIImageManager.shared.getImage(.alert)
        alertController.view.addSubview(imgViewTitle)

        self.present(alertController, animated: true, completion: nil)
    }
}


