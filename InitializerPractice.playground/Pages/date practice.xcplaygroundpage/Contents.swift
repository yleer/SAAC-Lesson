import Foundation
var currentMonthIndex = Calendar.current.component(.month, from: Date())

print("SDfasf")


func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()    // 1
        formatter.dateFormat = "yyyy-MM-dd" // 2
        guard let todayDate = formatter.date(from: today) else { return nil }  // 3
        let myCalendar = Calendar(identifier: .gregorian)   // 4
        let weekDay = myCalendar.component(.weekday, from: todayDate) // 5
        return weekDay
    }
