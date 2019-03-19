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
    var dpiLabelFive: UILabel?
    var dpiLabelSix: UILabel?
    var dpiLabelSeven: UILabel?
    var dpiLabelEight: UILabel?
    var dpiLabelNine: UILabel?
    var dpiLabelTen: UILabel?

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
        self.addSubview(self.dpiLabelFive!)
        self.addSubview(self.dpiLabelSix!)
        self.addSubview(self.dpiLabelSeven!)
        self.addSubview(self.dpiLabelEight!)
        self.addSubview(self.dpiLabelNine!)
        self.addSubview(self.dpiLabelTen!)
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

            label.text = String("Resolution: \(resX)x\(resY) Size: \(screenDiagonalInInch) inch")
        }

        if let label = self.dpiLabelThree {
            let ppi = data.cellData.ppi
            let ratioX = data.cellData.ratio_x
            let ratioY = data.cellData.ratio_y

            label.text = String("Ratio: \(ratioX)x\(ratioY) PPI: \(ppi)")
        }
        if let label = self.dpiLabelFour {
            let aspect_ratio = data.cellData.aspect_ratio

            label.text = String("Aspect ratio: : \(aspect_ratio)")
        }
        if let label = self.dpiLabelFive {
            let megaPix = data.cellData.numberOfMegapixels

            label.text = String("Number of megapixels: \(megaPix) MPix")
        }
        if let label = self.dpiLabelSix {
            let pixels = data.cellData.numberOfPixels

            label.text = String("Number of Pixels: \(pixels)")
        }
        if let label = self.dpiLabelSeven {
            let screenSizeX = data.cellData.screenSize_cmX
            let screenSizeY = data.cellData.screenSize_cmX

            label.text = String("Screen size: \(screenSizeX)x\(screenSizeY) cm")
        }
        if let label = self.dpiLabelEight {
            let workspace = data.cellData.workspace_cm

            label.text = String("Workspace: \(workspace) cm2")
        }
        if let label = self.dpiLabelNine {
            let screenSizeX = data.cellData.screenSize_inchX
            let screenSizeY = data.cellData.screenSize_inchY

            label.text = String("Screen size: \(screenSizeX)x\(screenSizeY) inch")
        }
        if let label = self.dpiLabelTen {
            let workspace = data.cellData.workspace_inch

            label.text = String("Workspace: \(workspace) inch2")
        }
    }

    private func configureCellSubViews() {
        self.backgroundColor = UIAppColorSet.shared.getColor(.clear)
        self.dpiImage = UIImageView()
        self.dpiLabel = UILabel()
        self.dpiLabelTwo = UILabel()
        self.dpiLabelThree = UILabel()
        self.dpiLabelFour = UILabel()
        self.dpiLabelFive = UILabel()
        self.dpiLabelSix = UILabel()
        self.dpiLabelSeven = UILabel()
        self.dpiLabelEight = UILabel()
        self.dpiLabelNine = UILabel()
        self.dpiLabelTen = UILabel()

        if let label = self.dpiLabel {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12)
        }
        if let label = self.dpiLabelTwo {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelThree {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelFour {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelFive {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelSix {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelSeven {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelEight {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelNine {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
        if let label = self.dpiLabelTen {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
        }
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
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelThree?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelTwo!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelFour?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelThree!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelFive?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelFour!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelSix?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelFive!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelSeven?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelSix!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelEight?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelSeven!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        self.dpiLabelNine?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelEight!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }
        self.dpiLabelTen?.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(dpiLabelNine!.snp.bottom).offset(5)
            make.height.equalTo(20)
            make.leading.equalTo(dpiImage!.snp.trailing).offset(5)
        }

        super.updateConstraints()
    }

    func setCellState(_ state: DPIHistoryCellState) {
        switch state {
        case .open:
            self.addSubview(self.dpiLabelThree!)
            self.addSubview(self.dpiLabelFour!)
            self.addSubview(self.dpiLabelFive!)
            self.addSubview(self.dpiLabelSix!)
            self.addSubview(self.dpiLabelSeven!)
            self.addSubview(self.dpiLabelEight!)
            self.addSubview(self.dpiLabelNine!)
            self.addSubview(self.dpiLabelTen!)
            self.setupConstrains()
        case .close:
            self.dpiLabelThree!.removeFromSuperview()
            self.dpiLabelFour!.removeFromSuperview()
            self.dpiLabelFive!.removeFromSuperview()
            self.dpiLabelSix!.removeFromSuperview()
            self.dpiLabelSeven!.removeFromSuperview()
            self.dpiLabelEight!.removeFromSuperview()
            self.dpiLabelNine!.removeFromSuperview()
            self.dpiLabelTen!.removeFromSuperview()
        }
    }
}
