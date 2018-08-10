//
//  MainViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        self.baseView = MainView()
        self.view = baseView
        setupNextNavigationButtons(for: "next")
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }

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

    func setupNextNavigationButtons(for next: String){
        let nextViewController = UIBarButtonItem(title: next, style: .plain, target: self, action: #selector(nextViewControllerAction))
        navigationItem.rightBarButtonItem = nextViewController
        title = "Next"
    }

    @objc private func nextViewControllerAction(){
        let nextViewController = ExampleViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}
