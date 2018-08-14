//
//  DPITableViewCellWithButton.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithButton: UITableViewCell {

    var dpiCellData: DPIMainTableDataModel?
    var dpiButton:  UIButton?
    var dpiImage:   UIImage?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureButton()
        self.addSubview(self.dpiButton!)
        self.updateConstraints()
    }

    private func configureButton() {
        self.dpiButton = UIButton()
        if let button = self.dpiButton{
            button.tintColor = UIAppColorSet.getColor(.white)
            button.backgroundColor = UIAppColorSet.getColor(.clear)
            button.setTitle(textForEnum.calculate.description, for: .normal)
            button.setImage(dpiCellData?.cellImage, for: .normal)

            button.setTitle("textForEnum.calculate.description", for: .highlighted)
            button.setImage(dpiCellData?.cellImage, for: .highlighted)

            button.setImagePosition(at: .left, withAdjustment: nil)
            button.imageView?.contentMode = .scaleAspectFit
        }
    }

    internal override func updateConstraints() {
        self.dpiButton?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(3)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        super.updateConstraints()
    }
}
