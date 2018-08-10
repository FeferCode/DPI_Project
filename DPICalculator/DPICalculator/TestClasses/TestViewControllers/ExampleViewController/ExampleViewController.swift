//
//  ExampleViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 08.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class ExampleViewController: DPIBaseViewController {

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        self.baseView = ExampleView()
        self.view = baseView
    }

    override func viewWillAppear(_ animated: Bool) {
        self.baseView.updateConstraints()
    }
}
