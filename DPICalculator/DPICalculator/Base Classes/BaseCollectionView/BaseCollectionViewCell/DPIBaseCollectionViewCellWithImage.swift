//
//  DPIBaseCollectionViewCellWithImage.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 29.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseCollectionViewCellWithImage: UICollectionViewCell {

    var dpiLabel: UILabel?
    var dpiImage: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiImage!)
        self.addSubview(self.dpiLabel!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {

        if let image = data.first?.cellImage {
            self.dpiImage?.addImage(image)
        }

        if let text = data.first?.cellText {
            self.dpiLabel?.text = text
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
            make.top.equalTo(snp.topMargin).offset(10)
            make.leading.equalTo(snp.leftMargin).offset(-10)
            make.trailing.equalTo(snp.rightMargin).offset(10)
        }

        self.dpiLabel?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(10)
            make.leading.equalTo(snp.leftMargin).offset(-10)
            make.trailing.equalTo(snp.rightMargin).offset(10)
//            make.
        }
        super.updateConstraints()
    }

}
