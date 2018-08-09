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
        self.baseView = MainView()
        self.view = baseView
    }

    override func viewDidLoad() {
        
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

}
