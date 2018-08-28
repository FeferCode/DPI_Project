//
//  DPIBaseTableViewHeader.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 28.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewHeader: UITableViewHeaderFooterView {

    var dpiLabel: UILabel?

    override init(reuseIdentifier: String?){
        super.init(reuseIdentifier: reuseIdentifier)

        self.configureCellSubViews()
        self.addSubview(self.dpiLabel!)
        self.setupConstrains()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupHeaderView(_ text: String) {

        if let label = dpiLabel {
            label.text = text
        }
    }

    private func configureCellSubViews() {
        self.contentView.backgroundColor = UIAppColorSet.getColor(.baseNavigationColor)
        self.dpiLabel = UILabel()
        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
    }

    private func setupConstrains() {
        self.dpiLabel?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }
    }


}
