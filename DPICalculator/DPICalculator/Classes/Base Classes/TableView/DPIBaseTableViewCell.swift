//
//  DPIBaseTableViewCell.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 12.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

enum DPIBaseTableViewStyleEnum {
    case button
    case label
    case textField
}

import UIKit

class DPIBaseTableViewCell: UITableViewCell {

    var dpiLabel: UILabel?
    var dpiField: UITextField?
    var dpiButton: UIButton?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    func setupCell(with style: DPIBaseTableViewStyleEnum){
        setupCell(style)
        addSubview(for: style)
    }

    private func setupCell(_ withStyle: DPIBaseTableViewStyleEnum) {
        switch withStyle {
        case .button:
            if case self.dpiButton = UIButton(){
                self.dpiButton!.tintColor = UIAppColorSet.getColor(.white)
                self.dpiButton!.backgroundColor = UIAppColorSet.getColor(.clear)
                self.dpiButton!.setTitle(textForEnum.calculate.description, for: .normal)
            }
        case .label:
            if case self.dpiLabel = UILabel() {
                self.dpiLabel!.textColor = UIAppColorSet.getColor(.white)
                self.dpiLabel!.backgroundColor = UIAppColorSet.getColor(.clear)
                self.dpiLabel!.text = textForEnum.calculate.description
            }

        case .textField:
            if case self.dpiField = UITextField() {
                self.dpiField!.textColor = UIAppColorSet.getColor(.white)
                self.dpiField!.backgroundColor = UIAppColorSet.getColor(.clear)
                self.dpiField!.text = textForEnum.calculate.description
            }
        }
    }

    private func addSubview(for uiObject: DPIBaseTableViewStyleEnum) {
        switch uiObject {
        case .button:
            self.addSubview(self.dpiButton!)
        case .label:
            self.addSubview(self.dpiLabel!)
        case .textField:
            self.addSubview(self.dpiField!)
        }
    }

}

