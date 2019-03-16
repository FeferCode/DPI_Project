//
//  DPISaveScreenDataView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 09/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPISaveScreenDataView: UIView {

    var containerView: DPIBaseContainerView
    var tableView: DPIBaseTableView

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
        self.setupViewColor()
        self.setupConstraints()
        super.updateConstraints()
    }

    private func setupViewColor(){
        self.backgroundColor = UIAppColorSet.shared.getColor(.white)
        self.containerView.backgroundColor = UIAppColorSet.shared.getColor(.baseBackgroundColor)
        self.tableView.backgroundColor = UIAppColorSet.shared.getColor(.clear)
        self.tableView.separatorColor = UIAppColorSet.shared.getColor(.clear)
    }

    private func setupConstraints(){
        self.containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(3)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }

        self.tableView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
}
