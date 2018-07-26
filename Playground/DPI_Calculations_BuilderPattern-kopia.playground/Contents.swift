import Foundation

struct ScreenData: CustomStringConvertible {

    var resolution: (x:Int,y:Int)
    var screenDiagonalInInch:Float
    
    init?(builder: ScreenDataBuilder){
        if let x = builder.resolution.x, let y = builder.resolution.y, let diagonal = builder.screenDiagonalInInch {
            resolution.x = x
            resolution.y = y
            screenDiagonalInInch = diagonal
        } else {
            return nil
        }
    }
    var description:String {
        return "Resolution: \(resolution.x)x\(resolution.y) with \(screenDiagonalInInch)\""
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

let display = ScreenDataBuilder  { builder in
    builder.resolution.x = 3840
    builder.resolution.y = 2160
    builder.screenDiagonalInInch = 27
}

let monitor = ScreenData(builder: display)


