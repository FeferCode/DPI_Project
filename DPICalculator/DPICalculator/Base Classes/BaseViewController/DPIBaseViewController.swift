//
//  BaseViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseViewController: UIViewController {

    var baseView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}