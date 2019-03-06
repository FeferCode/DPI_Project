//
//  DPIBaseTableViewCellWittFourTextFields.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWittFourLabels: UITableViewCell {

    var dpiImage: UIImageView?
    var dpiLabel: UILabel?
    var dpiLabelTwo: UILabel?
    var dpiLabelThree: UILabel?
    var dpiLabelFour: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiImage!)
        self.addSubview(self.dpiLabel!)
        self.addSubview(self.dpiLabelTwo!)
        self.addSubview(self.dpiLabelThree!)
        self.addSubview(self.dpiLabelFour!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIHistoryTableDataModel) {
        if let image = data.cellImage {
            self.dpiImage?.addImage(image)
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiImage = UIImageView()
        self.dpiLabel = UILabel()
        self.dpiLabelTwo = UILabel()
        self.dpiLabelThree = UILabel()
        self.dpiLabelFour = UILabel()

        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiLabel = UILabel()
        self.dpiImage = UIImageView()
        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
        }
        if let label = self.dpiLabelTwo {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
        }
        if let label = self.dpiLabelThree {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
        }
        if let label = self.dpiLabelFour {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
        }
    }

    private func setupConstrains() {
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)

            make.leading.equalToSuperview().offset(10)
        }
//
//        self.dpiField?.snp.makeConstraints { (make) -> Void in
//            make.centerY.equalToSuperview()
//            make.top.equalToSuperview().offset(5)
//            make.bottom.equalToSuperview().offset(-5)
//
//            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
//        }

//        self.dpiImageTwo?.snp.makeConstraints { (make) -> Void in
//            make.centerY.equalToSuperview()
//            make.height.equalTo(20)
//            make.width.equalTo(20)
//
//            make.leading.equalTo(dpiField!.snp.trailing).offset(5)
//        }
//
//        self.dpiFieldTwo?.snp.makeConstraints { (make) -> Void in
//            make.centerY.equalToSuperview()
//            make.top.equalToSuperview().offset(5)
//            make.bottom.equalToSuperview().offset(-5)
//
//            make.leading.equalTo(dpiImageTwo!.snp.trailing).offset(5)
//            make.trailing.equalToSuperview().offset(-10)
//        }

        super.updateConstraints()
    }
}
