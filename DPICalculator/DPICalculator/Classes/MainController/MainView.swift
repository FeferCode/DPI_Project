//
//  MainView.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 05.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

    var testView:UIView
    var testView1:UIView
    var testView2:UIView
    var testView3:UIView

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        testView = UIView()
        testView1 = UIView()
        testView2 = UIView()
        testView3 = UIView()

        self.testView.translatesAutoresizingMaskIntoConstraints = false
        self.testView1.translatesAutoresizingMaskIntoConstraints = false
        self.testView2.translatesAutoresizingMaskIntoConstraints = false
        self.testView3.translatesAutoresizingMaskIntoConstraints = false

        super.init(frame: frame)

        self.addSubview(testView)
        self.addSubview(testView1)
        self.addSubview(testView2)
        self.addSubview(testView3)

        self.updateConstraints()
    }

    override func updateConstraints() {
        self.backgroundColor = UIColor.black
        self.testView.backgroundColor = UIColor.green
        self.testView1.backgroundColor = UIColor.yellow
        self.testView2.backgroundColor = UIColor.orange
        self.testView3.backgroundColor = UIColor.red

        self.testView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(20)
            make.left.equalTo(self).offset(20)
            make.bottom.equalTo(testView1).offset(-20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(200)
        }

        self.testView1.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView).offset(20)
            make.left.equalTo(self).offset(20)
            make.bottom.equalTo(testView2).offset(-20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(200)
        }

        self.testView2.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView1).offset(20)
            make.left.equalTo(self).offset(20)
            make.bottom.equalTo(testView3).offset(-20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(200)
        }

        self.testView3.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(testView2).offset(20)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
            make.height.equalTo(200)
        }
        super.updateConstraints()
    }

    override func awakeFromNib() {
        self.updateConstraints()
    }
}
