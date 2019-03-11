//
//  AboutViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController:DPIBaseViewController {

    convenience init(){
        self.init(nibName:nil, bundle:nil)
        setTabBarItem()
    }

    func setTabBarItem(){
        let image = UIImage.fontAwesomeIcon(name: .calendar, style: .solid, textColor: .white, size: CGSize(width: 40, height: 40))
        self.tabBarItem = UITabBarItem(title: String.textForViewControllerTitle(.historyVC), image: image, tag: 1)
    }
}