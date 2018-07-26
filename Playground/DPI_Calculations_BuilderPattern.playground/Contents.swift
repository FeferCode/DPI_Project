import Foundation

struct constantValues {
    static let inch:Float = 2.54
}

struct ScreenData {
//    var name:String
//    var company:String
//    var model:String
//    var year: Int
//    var date: Date
    
    var resolution: (x:Int,y:Int) = (0,0)
    var screenDiagonalInInch:Float = 0
    var ratio: (x: Int, y: Int) = (0,0)
    var aspectRatio: (x: Float, y: Float) = (0,0)
    
    var screenSizeInCm:(x:Float,y:Float) = (0,0)
    var screenSizeInInch:(x:Float,y:Float) = (0,0)

//    var workSurfaceInCm:Float
//    var workSurfaceInInch:Float
    
    var numberOfPixels:Int = 0
    var numberOfMegaPixels:Float = 0
    var PPI:Float = 0
    
    init?(builder: ScreenDataBuilder){
        if let x = builder.resolution.x, let y = builder.resolution.y, let diagonal = builder.screenDiagonalInInch {
            resolution.x = x
            resolution.y = y
            screenDiagonalInInch = diagonal
            (numberOfPixels, numberOfMegaPixels) = calculateNumberOfPixels(width: x, height: y)
            (ratio.x, ratio.y, aspectRatio.x) = calculateRatio(width: x, height: y)
            aspectRatio.y = 1
            (screenSizeInInch.x, screenSizeInInch.y, screenSizeInCm.x, screenSizeInCm.y) = calculateScreenWidthAndHeight(x: x, y: y, inch: diagonal)
            PPI = calculatePpi(xPixel: x, yPixels: y, inch: diagonal)
        } else {
            return nil
        }
    }

    //Calculate number of all pixels
    private func calculateNumberOfPixels(width:Int, height:Int) -> (pixels:Int, megaPixels:Float) {
        let numberOfPixels = width * height
        let numberOfMegaPixels = (Float(width * height) / 1000)
            .rounded(FloatingPointRoundingRule.awayFromZero) / 1000
        return (pixels:numberOfPixels, megaPixels:numberOfMegaPixels)
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

    //Calculate dimensions
    private func calculateScreenWidthAndHeight(x:Int, y:Int, inch:Float) -> (xInch:Float, yInch:Float, xCm:Float, yCm:Float) {
        let leftSide = pow(Float(x), 2) + pow(Float(y), 2)
        let rightSide = pow(inch, 2)
        let myX = (rightSide / leftSide).squareRoot()

        let xInch = (myX * Float(x) * 100).rounded() / 100
        let yInch = (myX * Float(y) * 100).rounded() / 100
        let xCm = (xInch * constantValues.inch * 100).rounded() / 100
        let yCm = (yInch * constantValues.inch * 100).rounded() / 100

        return (xInch, yInch, xCm, yCm)
    }

    //Calculate PPI
    private func calculatePpi(xPixel:Int, yPixels:Int, inch:Float) -> Float {
        let ppi = (pow(Float(xPixel), 2) + pow(Float(yPixels), 2)).squareRoot() / inch
        let roundetPpi = ppi.rounded()
        return roundetPpi
    }

//
//    func setRatio(_ x:Int, _ y:Int, _ aspectRatio:Float){
//        self.ratio.x = x
//        self.ratio.y = y
//        x > y ? (self.aspectRatio = (aspectRatio,1)) : (self.aspectRatio = (1, aspectRatio))
//    }
//
//    func setScreenDimensions(_ xInch:Float, _ yInch:Float, _ xCm:Float, _ yCm:Float){
//        self.screenSizeInInch.x = xInch
//        self.screenSizeInInch.y = yInch
//        self.workSurfaceInInch = xInch * yInch
//        self.screenSizeInCm.x = xCm
//        self.screenSizeInCm.y = yCm
//        self.workSurfaceInCm = xCm * yCm
//    }
//
//    func setPPI(ppi:Float){
//        self.PPI = ppi
//    }
    
    func printTypesOfProperties(){
        print("=========================")
//        print("Create date: \(self.date)")
//        print("Company: \(self.company)")
//        print("Model: \(self.model)")
//        print("Year of production: \(self.year)")
        print("Screen size: \(self.screenDiagonalInInch) inch")
        print("Resolution: \(self.resolution.x) : \(self.resolution.y)")
        print("Ratio\(self.ratio)")
        print("Aspect ratio: \(self.aspectRatio.x):\(self.aspectRatio.y)")
        print("Screen size (cm): \(self.screenSizeInCm.x) : \(self.screenSizeInCm.y)")
//        print("Work surface (cm):\(self.workSurfaceInCm)")
        print("Screen size (inch): \(self.screenSizeInInch.x) : \(self.screenSizeInInch.y)")
//        print("Work surface (inch): \(self.workSurfaceInInch)")
        print("Number of pixels: \(self.numberOfPixels)")
        print("Number of megapiksels: \(self.numberOfMegaPixels) Mpix")
        print("Screen PPI: \(self.PPI)")
        print()
    }
}


class ScreenDataBuilder {
    
    var resolution: (x:Int?,y:Int?)
    var screenDiagonalInInch:Float?
    
    typealias BuilderClosure = (ScreenDataBuilder) -> ()
    
    init(builder: BuilderClosure) {
        builder(self)
    }
}





