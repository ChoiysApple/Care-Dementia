import Foundation

public struct DateManager {
    let today = Date()
    
    public func getYear() -> Int {
        return Calendar.current.component(.year, from: today)
    }
    
    public func getMonth() -> Int {
        return Calendar.current.component(.month, from: today)
    }
    
    public func getDay() -> Int {
        return Calendar.current.component(.day, from: today)
    }
    
    public func getWeekDay() -> String {
        let dayDay = ["","Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat"]
        return dayDay[Calendar.current.component(.weekday, from: today)]
    }
    
    public func getSeason() -> String {
        let month = Calendar.current.component(.month, from: today)
    
        if [12, 1, 2].contains(month) {
            return "Winter"
        } else if [3, 4, 5].contains(month) {
            return "Spring"
        } else if [6, 7, 8].contains(month) {
            return "Summer"
        } else {
            return "Autumn"
        }
    }

}
