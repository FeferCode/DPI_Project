import Foundation

struct ScreenData {
    var id: Int = 0
    var company:String = ""
    var model:String = ""
    var year: Int = 0
    
    var screenSizeInInch:Float = 0
    var ratio: (x: Float, y: Float) = (0,0)
    
    var width_cm:Float = 0
    var height_cm:Float = 0
    
    var width_in:Float = 0
    var height_in:Float = 0
    
    var resolution_X:Int = 0
    var resolution_Y:Int = 0

    init(width:Int, height:Int){
        
    }
    
    init(width:Float, height:Float){
        
    }

}
