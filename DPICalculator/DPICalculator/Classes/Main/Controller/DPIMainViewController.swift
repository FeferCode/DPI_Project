//
//  DPIMainViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIMainViewController: DPIBaseViewController {

    var myTableView: DPIBaseTableView!
    let tableViewData: []

    override func viewDidLoad() {
        setupViewsForController()
        self.view = baseView
//        setupNextNavigationButtons(for: "Test")
//        navigationController?.title = "Main"
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }

    //MARK :- Setup for navigation bar button
    func setupNextNavigationButtons(for next: String){
        let nextViewController = UIBarButtonItem(title: next, style: .plain, target: self, action: #selector(testViewControllerAction))
        navigationItem.rightBarButtonItem = nextViewController
    }

    @objc private func testViewControllerAction(){
        if let navigationController = navigationController as? BaseNavigationController {
            navigationController.pushExampleViewController(.firstVC, title: "Example ViewController", animated: true)
        }
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.baseView = DPIMainView()
        self.myTableView = (baseView as! DPIMainView).tableView as! DPIBaseTableView
        setupTableView()
    }

    private func setupTableView(){
        myTableView.register(DPIBaseTableViewCellWithButton.self, forCellReuseIdentifier: "ButtonCell")
        myTableView.register(DPIBaseTableViewCellWithTextField.self, forCellReuseIdentifier: "TextFieldCell")
        myTableView.register(DPIBaseTableViewCellWithTextLabel.self, forCellReuseIdentifier: "TextLabelCell")
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


