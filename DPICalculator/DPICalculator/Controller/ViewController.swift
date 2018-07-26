//
//  ViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.02.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createMonitor()
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

