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
    var dpiImage: UIImage?

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
            label.text = textForEnum.calculate.description
            label.addImage(uiImage: (dpiCellData?.cellImage)!, afterLabel: false)
        }
    }

    internal override func updateConstraints() {
        self.dpiLabel?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(3)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        super.updateConstraints()
    }

}
