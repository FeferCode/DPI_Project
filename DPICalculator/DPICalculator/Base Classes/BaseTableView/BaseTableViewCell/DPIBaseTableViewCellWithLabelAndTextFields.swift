//
//  DPIBaseTableViewCellWithLabelAndTextFields.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 10/02/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPIBaseTableViewCellWithLabelAndTextFields: UITableViewCell {

        var dpiImage: UIImageView?
        var dpiLabel: UILabel?
        var dpiField: UITextField?

        override func awakeFromNib() {
            super.awakeFromNib()

        }

        override func didMoveToSuperview() {
            self.configureCellSubViews()
            self.addSubview(self.dpiImage!)
            self.addSubview(self.dpiLabel!)
            self.addSubview(self.dpiField!)
            setupConstrains()
        }

        func setupCellData(_ data: DPIMainTableDataModel) {
            if let image = data.first?.cellImage {
                self.dpiImage?.addImage(image)
            }

            if let firstData = data.first {
                self.dpiLabel?.text = firstData.cellText
            }

            if let secondData = data.second {
                self.dpiField?.text = secondData.cellText
            }
            if let cellTag = data.second?.cellTag {
                self.tag = cellTag
            }
        }

        private func configureCellSubViews() {
            self.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            self.dpiImage = UIImageView()
            self.dpiLabel = UILabel()
            self.dpiField = UITextField()
            if let label = self.dpiLabel {
                label.textColor = UIAppColorSet.shared.getColor(.white)
                label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
                label.textAlignment = .right
                label.font = UIFont.boldSystemFont(ofSize: 12.0)
            }
            if let label = self.dpiField {
                label.textColor = UIAppColorSet.shared.getColor(.white)
                label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
                label.textAlignment = .left
                label.font = UIFont.boldSystemFont(ofSize: 12.0)
            }
        }

        private func setupConstrains() {
            self.dpiImage?.snp.makeConstraints { (make) -> Void in
                make.centerY.equalToSuperview()
                make.height.equalTo(20)
                make.width.equalTo(20)

                make.leading.equalToSuperview().offset(25)
            }

            self.dpiLabel?.snp.makeConstraints { (make) -> Void in
                make.centerY.equalToSuperview()
                make.top.equalToSuperview().offset(5)
                make.bottom.equalToSuperview().offset(-5)
                make.width.equalTo(140)
                make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
            }

            self.dpiField?.snp.makeConstraints { (make) -> Void in
                make.centerY.equalToSuperview()
                make.top.equalToSuperview().offset(5)
                make.bottom.equalToSuperview().offset(-5)

                make.leading.equalTo(dpiLabel!.snp.trailing).offset(5)
                make.trailing.equalToSuperview().offset(-25)
            }
            super.updateConstraints()
        }
}
