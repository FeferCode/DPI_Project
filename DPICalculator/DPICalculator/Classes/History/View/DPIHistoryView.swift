//
//  DPIHistoryView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 29.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIHistoryView: UIView {

    var containerView: DPIBaseContainerView
    var collectionView: DPIBaseCollectionView

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {

        containerView = DPIBaseContainerView()
        collectionView = DPIBaseCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())    //Nie można inicjalizować collectionVIew bez layout'u

        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: frame)

        containerView.addSubview(collectionView)
        self.addSubview(containerView)
    }

    override func updateConstraints() {

        if (superview == nil) {
            print("No superview in MainView")
            super.updateConstraints()
            return
        }

        self.setupViewColor()
        self.setupConstraints()
        super.updateConstraints()
    }

    private func setupViewColor(){
        self.backgroundColor = UIColor.white
        self.containerView.backgroundColor = UIAppColorSet.getColor(.baseBackgroundColor)
        self.collectionView.backgroundColor = UIAppColorSet.getColor(.clear)
    }

    private func setupConstraints(){
        self.containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(3)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }

        self.collectionView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }

}
