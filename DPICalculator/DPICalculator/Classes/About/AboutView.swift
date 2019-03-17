//
//  AboutView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11/03/2019.
//  Copyright © 2019 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

class DPIAboutView: UIView {

    var containerView: DPIBaseContainerView
    var DPILabel:UILabel?
    var DPILabelTwo:UILabel?

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        containerView = DPIBaseContainerView()
        self.containerView.translatesAutoresizingMaskIntoConstraints = false
        super.init(frame: frame)
        self.addSubview(containerView)
    }

    override func didMoveToSuperview() {
        self.configureSubViews()
        self.addSubview(self.DPILabel!)
        self.addSubview(self.DPILabelTwo!)
        self.setupConstraints()
    }

    override func updateConstraints() {
        self.setupViewColor()
    }

    private func setupViewColor(){
        self.backgroundColor = UIAppColorSet.shared.getColor(.white)
        self.containerView.backgroundColor = UIAppColorSet.shared.getColor(.baseBackgroundColor)
    }

    private func configureSubViews(){
        self.DPILabel = UILabel()
        self.DPILabelTwo = UILabel()

        if let label = self.DPILabel {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.baseNavigationColor)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 16.0)
            label.layer.cornerRadius = 5
            label.layer.maskedCorners = [.layerMinXMinYCorner,
                                        .layerMaxXMaxYCorner]
            label.clipsToBounds = true
            label.text = "OMG WTF"
        }

        if let label = self.DPILabelTwo {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 12.0)
            label.text = "OMG WTF"
        }
    }

    private func setupConstraints(){
        self.containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(snp.topMargin).offset(3)
            make.right.equalToSuperview().offset(-3)
            make.left.equalToSuperview().offset(3)
            make.bottom.equalTo(snp.bottomMargin).offset(-3)
        }

        self.DPILabel!.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(snp.topMargin).offset(30)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()

        }

        self.DPILabelTwo!.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(DPILabel!).offset(30)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()

        }
        super.updateConstraints()
    }
}
