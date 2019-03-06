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
//    var dpiLabelThree: UILabel?
//    var dpiLabelFour: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiImage!)
        self.addSubview(self.dpiLabel!)
        self.addSubview(self.dpiLabelTwo!)
//        self.addSubview(self.dpiLabelThree!)
//        self.addSubview(self.dpiLabelFour!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIHistoryTableDataModel) {
        if let image = data.cellImage {
            self.dpiImage?.addImage(image)
        }

        if let label = self.dpiLabel {
            if let company = data.cellData.company, let model = data.cellData.model {
                label.text = String("\(company) \(model)")
            }
        }
        if let label = self.dpiLabelTwo {
            let screenDiagonalInInch = data.cellData.screenDiagonalInInch
            let resX = data.cellData.resolution_x
            let resY = data.cellData.resolution_y

            label.text = String("Resolution: \(resX)x\(resY) Size: \(screenDiagonalInInch)")
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiImage = UIImageView()
        self.dpiLabel = UILabel()
        self.dpiLabelTwo = UILabel()
//        self.dpiLabelThree = UILabel()
//        self.dpiLabelFour = UILabel()

        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12)
        }
        if let label = self.dpiLabelTwo {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
//        if let label = self.dpiLabelThree {
//            label.textColor = UIAppColorSet.getColor(.white)
//            label.backgroundColor = UIAppColorSet.getColor(.clear)
//            label.textAlignment = .right
//            label.font = UIFont.boldSystemFont(ofSize: 12.0)
//        }
//        if let label = self.dpiLabelFour {
//            label.textColor = UIAppColorSet.getColor(.white)
//            label.backgroundColor = UIAppColorSet.getColor(.clear)
//            label.textAlignment = .right
//            label.font = UIFont.boldSystemFont(ofSize: 12.0)
//        }
    }

    private func setupConstrains() {
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.leading.equalToSuperview().offset(25)
        }

        self.dpiLabel?.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelTwo?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabel!.snp.bottom).offset(5)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        super.updateConstraints()
    }
}
