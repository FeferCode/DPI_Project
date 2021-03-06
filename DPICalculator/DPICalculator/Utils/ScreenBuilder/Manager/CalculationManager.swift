//
//  CalculationManager.swift
//  DPICalculator
//
//  Created by Jakub Majewski on 20.02.2018.
//  Copyright © 2018 Jakub Majewski. All rights reserved.
//

import Foundation

class CalculationManager {

    func calculateAllData(ForScreen data:BaseScreenData) -> ScreenData {
        var screenData = ScreenData()
        screenData.setBaseData(data)

        let ratio = calculateRatio(OnScreen: data)
        screenData.setRatio(x: ratio.x,
                            y: ratio.y,
                            aspectRatio: ratio.aspectRatio)

        let screenSize = calculateScreenSize(OnScreen: data)
        screenData.setScreenSize(xInch: screenSize.xInch,
                                 yInch: screenSize.yInch,
                                 xCm: screenSize.xCm,
                                 yCm: screenSize.yCm)

        screenData.setWorkSurface(cm: (screenSize.xCm * screenSize.yCm),
                                  inch: (screenSize.xInch * screenSize.yInch))

        let pixels = numberOfPixels(OnScreen: data)
        let megaPixels = numberOfMegaPixels(OnScreen: data)
        screenData.setNumberOf(pixels: pixels,
                               megaPixels: megaPixels)

        let ppi = calculatePpi(OnScreen: data)
        screenData.setPPI(ppi)
        return screenData
    }

    
    //Calculate number of pixels in screen
    private func numberOfPixels(OnScreen data:BaseScreenData) -> Int {
        return data.resolution.x * data.resolution.y
    }
    
    //Calculate roundet number of megapixels in screen
    private func numberOfMegaPixels(OnScreen data:BaseScreenData) -> Float {
        let number = data.resolution.x * data.resolution.y
        return (Float(number) / 1000).rounded(FloatingPointRoundingRule.awayFromZero) / 1000
    }
    
    //Calculate ratio and aspect ratio
    private func calculateRatio(OnScreen: BaseScreenData) -> (x:Int, y:Int, aspectRatio:Float) {
        var aspectRatio:Float
        
        if OnScreen.resolution.x > OnScreen.resolution.y {
            aspectRatio = Float(OnScreen.resolution.x) / Float(OnScreen.resolution.y)
            let ratio = findRatio(aspectRatio: aspectRatio)
            return (ratio.x, ratio.y, aspectRatio)
        } else {
            aspectRatio = Float(OnScreen.resolution.y) / Float(OnScreen.resolution.x)
            let ratio = findRatio(aspectRatio: aspectRatio)
            return (ratio.y, ratio.x, aspectRatio)
        }
    }
    
    //Calculate ratio
    private func findRatio(aspectRatio:Float) -> (x: Int, y:Int) {
        var divider:Float = 0
        var number:Float = 0
        repeat {
            divider += 1
            let ratio = aspectRatio * divider
            number = ratio.truncatingRemainder(dividingBy: 1)
        } while number != 0
        return ((Int(aspectRatio * divider)), Int(divider))
    }
    
    private func calculateScreenSize(OnScreen: BaseScreenData)  -> (xInch:Float, yInch:Float, xCm:Float, yCm:Float) {
        let x = OnScreen.resolution.x
        let y = OnScreen.resolution.y
        let inch = OnScreen.screenDiagonalInInch
        
        let leftSide = pow(Float(x), 2) + pow(Float(y), 2)
        let rightSide = pow(inch, 2)
        let myX = (rightSide / leftSide).squareRoot()
        
        let xInch = (myX * Float(x) * 100).rounded() / 100
        let yInch = (myX * Float(y) * 100).rounded() / 100
        let xCm = (xInch * ConstantValues.inch * 100).rounded() / 100
        let yCm = (yInch * ConstantValues.inch * 100).rounded() / 100
        
        return (xInch, yInch, xCm, yCm)
    }
    
    //Calculate PPI
    private func calculatePpi(OnScreen:BaseScreenData) -> Float{
        let ppi = (pow(Float(OnScreen.resolution.x), 2) + pow(Float(OnScreen.resolution.y), 2)).squareRoot() / OnScreen.screenDiagonalInInch
        let roundetPpi = ppi.rounded()
        return roundetPpi
    }
}
