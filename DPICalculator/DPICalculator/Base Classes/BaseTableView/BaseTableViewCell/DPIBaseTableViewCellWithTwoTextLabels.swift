//
//  DPIBaseTableViewCellWithTwoTextLabels.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 24.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCellWithTwoTextLabels: UITableViewCell {

    var dpiImage: UIImageView?
    var dpiFirstLabel: UILabel?
    var dpiSecondLabel: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func didMoveToSuperview() {
        self.configureCellSubViews()
        self.addSubview(self.dpiImage!)
        self.addSubview(self.dpiFirstLabel!)
        self.addSubview(self.dpiSecondLabel!)
        setupConstrains()
    }

    func setupCellData(_ data: DPIMainTableDataModel) {
        if let firstData = data.first {
            self.dpiFirstLabel?.text = firstData.cellText
        }

        if let secondData = data.second {
            self.dpiSecondLabel?.text = secondData.cellText
        }

        if let image = data.first?.cellImage {
            self.dpiImage?.addImage(image)
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.getColor(.clear)
        self.dpiImage = UIImageView()
        self.dpiFirstLabel = UILabel()
        self.dpiSecondLabel = UILabel()
        if let label = self.dpiFirstLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            label.textAlignment = .right
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiSecondLabel {
            label.textColor = UIAppColorSet.getColor(.white)
            label.backgroundColor = UIAppColorSet.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }

    }

    private func setupConstrains() {
        self.dpiImage?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(20)

            make.leading.equalToSuperview().offset(50)
        }

        self.dpiFirstLabel?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)

            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiSecondLabel?.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)

            make.leading.equalTo(dpiFirstLabel!.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(-50)
        }
        super.updateConstraints()
    }

}
