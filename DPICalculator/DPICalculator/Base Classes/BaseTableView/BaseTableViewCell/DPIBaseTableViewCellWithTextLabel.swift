//
//  DPIBaseTableViewCellWithTextLabel.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTextLabel: UITableViewCell {

    var dpiLabel: UILabel?
    var dpiImage: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiLabel!)
        self.addSubview(self.dpiImage!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let text = data.first?.cellText {
            self.dpiLabel?.text = data.first?.cellText
        }
        if let image = data.first?.cellImage {
            self.dpiImage?.addImage(image)
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiLabel = UILabel()
        self.dpiImage = UIImageView()
        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
        }
    }

    private func setupConstrains() {
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
        super.updateConstraints()
    }

}
