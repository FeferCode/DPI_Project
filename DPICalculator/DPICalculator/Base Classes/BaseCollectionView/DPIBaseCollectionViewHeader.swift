//
//  DPIBaseCollectionViewHeader.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 29.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseCollectionViewHeader: UICollectionViewCell {

    var dpiLabel:UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.backgroundColor = .darkGray
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        if let label = dpiLabel {
            label.text = nil
        }
    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiLabel!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {

        if let text = data.first?.cellText {
            self.dpiLabel?.text = text
        }

    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiLabel = UILabel()
        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.baseNavigationColor)
        }
    }

    private func setupConstrains() {

        self.dpiLabel?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(10)
            make.leading.equalTo(snp.leftMargin).offset(-10)
            make.trailing.equalTo(snp.rightMargin).offset(10)
            make.bottom.equalTo(snp.bottomMargin).offset(-10)
        }
        super.updateConstraints()
    }
    
}
