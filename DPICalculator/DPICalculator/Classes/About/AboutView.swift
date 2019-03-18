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
    var DPIimage:UIImageView?
    var DPITextView:UILabel?
    var DPIButton:UIButton?

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
        self.addSubview(self.DPITextView!)
        self.addSubview(self.DPIButton!)
        self.addSubview(self.DPIimage!)
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
        self.DPITextView = UILabel()
        self.DPIButton = UIButton()
        self.DPIimage = UIImageView()

        if let label = self.DPILabel {
            label.textColor = UIAppColorSet.shared.getColor(.white)
            label.backgroundColor = UIAppColorSet.shared.getColor(.baseNavigationColor)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
            label.layer.cornerRadius = 5
            label.layer.maskedCorners = [.layerMinXMinYCorner,
                                        .layerMaxXMaxYCorner]
            label.clipsToBounds = true
            label.text = "DPI Calculator"
        }

        if let image = self.DPIimage {
            image.addImage(UIImage(named: "Startup_iCon")!)
            image.contentMode = .scaleAspectFit
            image.layer.borderWidth = 2
            image.layer.borderColor =  UIAppColorSet.shared.getColor(.white).cgColor
            image.layer.cornerRadius = 10
            image.layer.shadowRadius = 5
            image.layer.shadowColor = UIAppColorSet.shared.getColor(.black).cgColor
        }

        if let textView = self.DPITextView {
            textView.textColor = UIAppColorSet.shared.getColor(.white)
            textView.backgroundColor = UIAppColorSet.shared.getColor(.clear)
            textView.textAlignment = .center
            textView.numberOfLines = 0
            textView.font = UIFont.boldSystemFont(ofSize: 12.0)
            textView.layer.cornerRadius = 5
            textView.layer.maskedCorners = [.layerMinXMinYCorner,
                                         .layerMaxXMaxYCorner]
            textView.clipsToBounds = true
            textView.text = "This app was create by Jakub Majewski. \nFor more information please visit fefercode.pl."
        }

        if let button = self.DPIButton {
            button.setTitle("Open FeferCode.pl", for: .normal)
            button.backgroundColor = UIAppColorSet.shared.getColor(.baseNavigationColor)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.layer.cornerRadius = 5
            button.layer.maskedCorners = [.layerMinXMinYCorner,
                                         .layerMaxXMaxYCorner]
            button.clipsToBounds = true
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

        self.DPIimage!.snp.makeConstraints{(make) -> Void in
            make.height.width.equalTo(200)
            make.top.equalTo(DPILabel!.snp.bottom).offset(30)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }

        self.DPITextView!.snp.makeConstraints{(make) -> Void in
            make.height.equalTo(60)
            make.top.equalTo(DPIimage!.snp.bottom).offset(30)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()

        }
        self.DPIButton!.snp.makeConstraints{(make) -> Void in
            make.bottom.equalToSuperview().offset(-30)
            make.right.equalToSuperview().offset(-30)
            make.left.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()

        }
        super.updateConstraints()
    }

    @objc private func buttonAction(){
        let alertController = UIAlertController(title: "Alert", message: "Do you want to open fefercode web page?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Open", style: .default, handler: { (nil) in
            if let link = URL(string: "http://fefercode.pl") {
                UIApplication.shared.open(link)
            }
        }))

        let imgViewTitle = UIImageView(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        imgViewTitle.image = UIImageManager.shared.getImage(.alert)
        alertController.view.addSubview(imgViewTitle)

        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            topController.present(alertController, animated: true, completion: nil)
        }
    }
}
