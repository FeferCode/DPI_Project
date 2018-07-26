import Foundation

struct ScreenData {
    private var id: Int = 0
    private var company:String = ""
    private var model:String = ""
    private var year: Int = 0
    
    private var screenSizeInInch:Float = 0
    private var ratio: (x: Float, y: Float) = (0,0)
    
    private var width_cm:Float = 0
    private var height_cm:Float = 0
    
    private var width_in:Float = 0
    private var height_in:Float = 0
    
    private var resolution_X:Int = 0
    private var resolution_Y:Int = 0
    
    init(pixelsWidth:Int, pixelsHeight:Int, inch:Float){
        
    }
    
    func setPhisicalSIze(hCm:Float, wCm:Float, hInch:Float, ) {
        self.height_cm =
        self.width_cm =
        self.height_in =
        self.width_in =
        
    }
    
    
}

class CalculateManager{
    let cal:Float = 2.54
    public static let share = CalculateManager()
    private init(){}
    
    func calculateFromPixels(width:Int, height:Int, inch:Float) -> ScreenData {
        var screenDataObj = ScreenData(pixelsWidth: width, pixelsHeight: height, inch: inch)
        
        let pixelNumber = numberOfPixels(width: width, height: height)
        let mPixelNumer = numberOfMegaPixels(OnScreen: number)
        calculateRatio(width: width, height: height)
        calculateScreenWidthAndHeight(x: width, y: height, inch: inch)
        calculatePpi(xPixel: width, yPixels: height, inch: inch)
        
        return screenDataObj
    }
    
    //Calculate number of all pixels
    private func numberOfPixels(width:Int, height:Int) -> Int {
        return width * height
    }
    
    //Calculate roundet number of megapixels
    private func numberOfMegaPixels(OnScreen number:Int) -> Float {
        return (Float(number) / 1000).rounded(FloatingPointRoundingRule.awayFromZero) / 1000
    }
    
    //Calculate ratio and aspect ratio
    private func calculateRatio(width:Int, height:Int) -> (x:Int, y:Int, aspectRatio:Float) {
        var aspectRatio:Float
        
        if width > height {
            aspectRatio = Float(width) / Float(height)
            let ratio = findRatio(aspectRatio: aspectRatio)
            return (ratio.x, ratio.y, aspectRatio)
        } else {
            aspectRatio = Float(height) / Float(width)
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
    
    private func calculateScreenWidthAndHeight(x:Int, y:Int, inch:Float)  -> (xInch:Float, yInch:Float, xCm:Float, yCm:Float) {
        let leftSide = pow(Float(x), 2) + pow(Float(y), 2)
        let rightSide = pow(inch, 2)
        let myX = (rightSide / leftSide).squareRoot()
        
        let xInch = (myX * Float(x) * 100).rounded() / 100
        let yInch = (myX * Float(y) * 100).rounded() / 100
        let xCm = (xInch * cal * 100).rounded() / 100
        let yCm = (yInch * cal * 100).rounded() / 100

        return (xInch, yInch, xCm, yCm)
    }
    
    //Calculate PPI
    private func calculatePpi(xPixel:Int, yPixels:Int, inch:Float) -> Float{
        let ppi = (pow(Float(xPixel), 2) + pow(Float(yPixels), 2)).squareRoot() / inch
        let roundetPpi = ppi.rounded()
        return roundetPpi
    }
    
}


let manager = CalculateManager.share

let obj1 = manager.calculateFromPixels(width: 1920, height: 1080, inch: 24)
let obj2 = manager.calculateFromPixels(width: 2560, height: 1440, inch: 24)
let obj3 = manager.calculateFromPixels(width: 3840, height: 2160, inch: 24)

let obj4 = manager.calculateFromPixels(width: 1920, height: 1080, inch: 27)
let obj5 = manager.calculateFromPixels(width: 2560, height: 1440, inch: 27)
let obj6 = manager.calculateFromPixels(width: 3840, height: 2160, inch: 27)

let obj7 = manager.calculateFromPixels(width: 1920, height: 1080, inch: 28)
let obj8 = manager.calculateFromPixels(width: 2560, height: 1440, inch: 28)
let obj9 = manager.calculateFromPixels(width: 3840, height: 2160, inch: 28)



