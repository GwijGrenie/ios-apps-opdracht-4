
import Foundation


protocol ClockHelperDelegate {
    func updateClock(_ result: [String])
}

class ClockHelper {
    
    private let hoursMapping : [Int : String] = [
        1 : "EEN",
        2 : "TWEE",
        3 : "DRIE",
        4 : "VIER",
        5 : "VIJF",
        6 : "ZES",
        7 : "ZEVEN",
        8 : "ACHT",
        9 : "NEGEN",
        10 : "TIEN",
        11 : "ELF",
        12 : "TWAALF"
    ]
    
    private let minutesMapping : [Int : [String]] = [
        5 : ["VIJF_M", "OVER"],
        10 : ["TIEN_M", "OVER"],
        15 : ["KWART", "OVER"],
        20 : ["TIEN_M", "VOOR", "HALF"],
        25 : ["VIJF_M", "VOOR", "HALF"],
        30 : ["HALF"],
        35 : ["VIJF_M", "OVER", "HALF"],
        40 : ["TIEN_M", "OVER", "HALF"],
        45 : ["KWART", "OVER"],
        50 : ["TIEN_M", "VOOR"],
        55 : ["VIJF_M", "VOOR"]
    ]
    
    private var delegate: ClockHelperDelegate?
    
    init(Delegate delegate: ClockHelperDelegate) {
        self.delegate = delegate
        delegate.updateClock(getTextFromTime(Date: Date()))
        startTimer()
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true){ timer in
            self.updateClock(timer)
        }
    }
    
    private func updateClock(_ timer: Timer) {
        delegate?.updateClock(getTextFromTime(Date: timer.fireDate))
    }
    
    public func getTextFromTime(Date date: Date) -> [String] {
        
        var result = ["HET", "IS"]
        let calendar = Calendar.current
        
        var hours = calendar.component(.hour, from: date)
        let minutes = NumberHelper.roundToNearestMultiple(Number: calendar.component(.minute, from: date), Multiple: 5)
    
        if(hours > 12) {
            hours -= 12
        }
        
        result += minutesMapping[minutes]!
        
        if (minutes >= 20){
            hours = hours + 1 == 13 ? 1 : hours + 1
        }
        
        result.append(hoursMapping[hours]!)
        
        return result
    }
    
    
}
