//
//  NoViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit
import FontAwesome_swift

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
        let image = UIImageManager.shared.getImage(.noImage)
        self.tabBarItem = UITabBarItem(title: String.textForViewControllerTitle(.noViewController), image: image, tag: 2)
    }
}
