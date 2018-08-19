//
//  DPIBaseTableViewCellWithImageView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 19.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithImageView: UITableViewCell {

    var dpiCellData: DPIMainTableDataModel?
    var dpiImage: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureImageView()
        self.addSubview(self.dpiImage!)
        self.updateConstraints()
    }

    private func configureImageView() {
        self.dpiImage = UIImageView()
        if let image = self.dpiImage {
            image.backgroundColor = UIAppColorSet.getColor(.clear)
            if let data = dpiCellData {
                image.addImage(data.cellImage!)
            }
        }
    }

    internal override func updateConstraints() {
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
