//
//  MainViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var mainView: MainView {
        return view as! MainView
    }

    override func loadView() {
        let contentView = MainView(frame: .zero)
        contentView.button.addTarget(self, action: Selector(("createMonitor")), for: .touchUpOutside)

        view = contentView
    }

    override func viewWillLayoutSubviews() {
        mainView.stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true

    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }

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
