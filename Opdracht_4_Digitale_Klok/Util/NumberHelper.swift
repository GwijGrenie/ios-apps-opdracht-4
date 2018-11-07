import Foundation

class NumberHelper{
    
    private init() {}
    
    public static func roundToNearestMultiple(Number number: Int, Multiple multiple: Int) -> Int {
        return number - number%multiple
    }
    
}
