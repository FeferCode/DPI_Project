//
//  DPIMainView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit
import SnapKit

class DPIMainView: UIView {

    var containerView: UIView
    var tableView: UITableView

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {

        containerView = DPIBaseContainerView()
        tableView = DPIBaseTableView()

        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: frame)

        containerView.addSubview(tableView)
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
        self.containerView.backgroundColor = UIAppColorSet.getColor(.tomato)
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.layer.borderWidth = 1
        self.tableView.layer.borderColor = UIAppColorSet.getColor(.white).cgColor

    }

    private func setupConstraints(){
        self.containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin)
            make.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }

        self.tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
