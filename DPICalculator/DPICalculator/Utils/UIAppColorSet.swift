//
//  UIAppColorSet.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 11.08.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation
import Colours
import UIKit

enum colorSet {
    case clear
    case white
    case black
    case iConColor
    case baseNavigationColor
    case baseBackgroundColor

}

class UIAppColorSet {
    public static let shared = UIAppColorSet()
    var theme:AppThemeColor

    private init(){
        self.theme = AppThemeColor()
    }

    final func getColor(_ colorSet:colorSet) -> UIColor {
        switch colorSet {
        case .clear:
            return self.theme.clear
        case .white:
            return self.theme.white
        case .black:
            return self.theme.black
        case .iConColor:
            return self.theme.iConColor
        case .baseNavigationColor:
            return self.theme.baseNavigationColor
        case .baseBackgroundColor:
            return self.theme.baseBackgroundColor
        }
    }
}

struct AppThemeColor {

    var clear:UIColor = UIColor.clear
    var white:UIColor = UIColor.white
    var black:UIColor = UIColor.black
    var iConColor:UIColor = UIColor.white
    var baseNavigationColor:UIColor = UIColor.denim()
    var baseBackgroundColor:UIColor = UIColor.pastelBlue()

    init() {
//        self.defaultTheme()
        self.newTheme()
    }
    
    mutating public func defaultTheme(){
        self.clear = UIColor.clear
        self.white = UIColor.white
        self.black = UIColor.black
        self.iConColor = UIColor.white
        self.baseNavigationColor = UIColor.denim()
        self.baseBackgroundColor = UIColor.pastelBlue()
    }

    mutating public func newTheme(){
        self.clear = UIColor.clear
        self.white = UIColor(rgb: 0x581845)
        self.black = UIColor(rgb: 0x900c3f)
        self.iConColor = UIColor(rgb: 0xc70039)
        self.baseNavigationColor = UIColor(rgb: 0xff5733)
        self.baseBackgroundColor = UIColor(rgb: 0xffc300)
    }

    mutating public func testTheme(){
        self.clear = UIColor.clear
        self.white = UIColor(rgb: 0x581845)
        self.black = UIColor(rgb: 0x900c3f)
        self.iConColor = UIColor(rgb: 0xc70039)
        self.baseNavigationColor = UIColor(rgb: 0xff5733)
        self.baseBackgroundColor = UIColor(rgb: 0xffc300)
    }

}
//
//struct Theme {
//
//    static var backgroundColor:UIColor?
//    static var buttonTextColor:UIColor?
//    static var buttonBackgroundColor:UIColor?
//
//    static public func defaultTheme() {
//        self.backgroundColor = UIColor.white
//        self.buttonTextColor = UIColor.blue
//        self.buttonBackgroundColor = UIColor.white
//        updateDisplay()
//    }
//
//    static public func darkTheme() {
//        self.backgroundColor = UIColor.darkGray
//        self.buttonTextColor = UIColor.white
//        self.buttonBackgroundColor = UIColor.black
//        updateDisplay()
//    }
//
//    static public func updateDisplay() {
//        let proxyButton = UIButton.appearance()
//        proxyButton.setTitleColor(Theme.buttonTextColor, for: .normal)
//        proxyButton.backgroundColor = Theme.buttonBackgroundColor
//
//        let proxyView = UIView.appearance()
//        proxyView.backgroundColor = backgroundColor
//    }
//}
//
//


//view0.backgroundColor = UIColor(rgb: 0x581845)
//view1.backgroundColor = UIColor(rgb: 0x900c3f)
//view2.backgroundColor = UIColor(rgb: 0xc70039)
//view3.backgroundColor = UIColor(rgb: 0xff5733)
//view4.backgroundColor = UIColor(rgb: 0xffc300)

