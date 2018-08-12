//
//  DPIBaseTableViewCell.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import UIKit

class DPIBaseTableViewCell: UITableViewCell {

    var dpiLabel: UILabel? = UILabel()
    var dpiField: UITextField? = UITextField()
    var dpiButton: UIButton? = UIButton()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String!){
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //Initialize views
        self.dpiLabel = UILabel(frame: CGRect(x: 119.00, y: 9, width: 216.00, height: 31.00));
        self.dpiField = UITextField(frame: CGRect(x: 119.00, y: 9, width: 216.00, height: 31.00));
        self.dpiButton = UIButton(frame: CGRect(x: 119.00, y: 9, width: 216.00, height: 31.00));

        //Adding views to SubView
        self.addSubview(self.dpiLabel!)
        self.addSubview(self.dpiField!)
        self.addSubview(self.dpiButton!)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
