//
//  ExampleView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 08.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class SecondExampleView: UIView {

    var testView:UIView
    var testView1:UIView
    var testView2:UIView
    var testView3:UIView
    var testButton:UIButton

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        testView = UIView()
        testView1 = UIView()
        testView2 = UIView()
        testView3 = UIView()
        testButton = UIButton()

        self.testView.translatesAutoresizingMaskIntoConstraints = false
        self.testView1.translatesAutoresizingMaskIntoConstraints = false
        self.testView2.translatesAutoresizingMaskIntoConstraints = false
        self.testView3.translatesAutoresizingMaskIntoConstraints = false
        self.testButton.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: frame)

        self.addSubview(testView)
        self.addSubview(testView1)
        self.addSubview(testView2)
        self.addSubview(testView3)
        self.setupButton()
        self.addSubview(testButton)
    }

    override func updateConstraints() {
        guard let superView = superview else {
            print("No superview in ExampleView")
            super.updateConstraints()
            return
        }

        self.backgroundColor = UIColor.white
        self.testView.backgroundColor = UIColor.green
        self.testView1.backgroundColor = UIColor.yellow
        self.testView2.backgroundColor = UIColor.orange
        self.testView3.backgroundColor = UIColor.red

        self.testView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(superView).offset(200)
            make.right.equalTo(superView).offset(-20)
            make.height.equalTo(50)
        }

        self.testView1.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView).offset(60)
            make.left.equalTo(superView).offset(20)
            make.right.equalTo(superView).offset(-20)
            make.height.equalTo(50)
        }

        self.testView2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView1).offset(60)
            make.left.equalTo(superView).offset(20)
            make.right.equalTo(superView).offset(-20)
            make.height.equalTo(50)
        }

        self.testView3.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView2).offset(60)
            make.left.equalTo(superView).offset(20)
            make.right.equalTo(superView).offset(-20)
            make.height.equalTo(50)
        }

        self.testButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView3).offset(60)
            make.left.equalTo(superView).offset(20)
            make.right.equalTo(superView).offset(-20)
            make.height.equalTo(50)
        }

        super.updateConstraints()
    }

    func setupButton(){
        self.testButton.setTitle("Close Example View", for: .normal)
        self.testButton.backgroundColor = .blue
        self.testButton.addTarget(self, action: #selector(self.actionButton), for: .touchUpInside)
    }

    @objc func actionButton(){
        let root = RootViewController.shared
        root.closeExampleViewController()
    }
}
