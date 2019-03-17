//
//  AboutViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPIAboutViewController:DPIBaseViewController {


    convenience init(){
        self.init(nibName:nil, bundle:nil)
        setTabBarItem()
    }

    override func viewDidLoad() {
        setupViewsForController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.updateConstraints()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.baseView = DPIAboutView()
        self.view = baseView
    }

    func setTabBarItem(){
        let image = UIImageManager.shared.getImage(.about)
        self.tabBarItem = UITabBarItem(title: String.textForViewControllerTitle(.aboutVC), image: image, tag: 1)
    }


}
