//
//  DPIBaseTableViewCellWithTextLabel.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTextLabel: UITableViewCell {

    var dpiCellData: DPIMainTableDataModel?
    var dpiLabel: UILabel?
    var dpiImage: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureButton()
        self.addSubview(self.dpiLabel!)
        self.updateConstraints()
    }

    private func configureButton() {
        self.dpiLabel = UILabel()
        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            if let data = dpiCellData {
                label.text = data.cellText
                dpiImage?.addImage(data.cellImage!)
            }
        }
    }

    internal override func updateConstraints() {

        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }

        self.dpiLabel?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(20)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        super.updateConstraints()
    }

}
