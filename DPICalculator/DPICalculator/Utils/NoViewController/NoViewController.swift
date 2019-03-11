//
//  NoViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class NoViewController: DPIBaseViewController {

    convenience init(){
        self.init(nibName:nil, bundle:nil)
        setTabBarItem()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setTabBarItem(){
        let image = UIImage.fontAwesomeIcon(name: .notesMedical, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        self.tabBarItem = UITabBarItem(title: String.textForViewControllerTitle(.noViewController), image: image, tag: 2)
    }
}
