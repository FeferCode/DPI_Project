//
//  ExampleViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 08.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class ExampleViewController: BaseViewController {

    override func loadView() {
        super.loadView()
        self.baseView = ExampleView()
        self.view = baseView
    }

    override func viewDidLoad() {
        
    }

}
