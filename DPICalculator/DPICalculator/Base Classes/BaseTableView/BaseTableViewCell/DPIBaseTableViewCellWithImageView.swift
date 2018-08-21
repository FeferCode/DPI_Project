//
//  DPIBaseTableViewCellWithImageView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 19.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithImageView: UITableViewCell {

    var dpiImage: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiImage!)
        self.setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let image = data.first?.cellImage {
             self.dpiImage?.addImage(image)
        }
    }

    private func configureCellSubViews() {
        self.dpiImage = UIImageView()
        if let image = self.dpiImage {
            image.backgroundColor = UIAppColorSet.getColor(.clear)
        }
    }

    private func setupConstrains() {
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.lessThanOrEqualTo(50)
            make.width.lessThanOrEqualTo(50)
        }

        self.backgroundColor = UIAppColorSet.getColor(.clear)
        super.updateConstraints()
    }

}
