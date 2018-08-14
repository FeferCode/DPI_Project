//
//  UIButton+Image.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 14.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func setImagePosition(at pos:ButtonImagePosition, withAdjustment adj:CGFloat?) {

        let _adj:CGFloat = (adj != nil) ? adj! : 0
        let width = frame.size.width
        var imgWidth = self.imageView?.frame.size.width

        switch pos {
        case .center:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        case .right:
            imgWidth = imgWidth! - _adj
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: width - imgWidth!, bottom: 0, right: 0)
        case .left:
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: width + imgWidth!)
        }
    }
}

enum ButtonImagePosition {
    case left
    case right
    case center
}
