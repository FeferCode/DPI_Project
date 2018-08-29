//
//  DPIHistoryViewController.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 29.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIHistoryViewController: DPIBaseViewController {

    var myCollectionView:DPIBaseCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewsForController()
    }

    //MARK :- Setup Views
    private func setupViewsForController(){
        self.baseView = DPIHistoryView()
        self.myCollectionView = (baseView as! DPIHistoryView).collectionView
        self.view = baseView
        setupCollectionView()
    }

    private func setupCollectionView(){
        myCollectionView.allowsSelection = false
//        myCollectionView.dataSource = self
//        myCollectionView.delegate = self
    }

}
