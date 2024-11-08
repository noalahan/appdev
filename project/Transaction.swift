import SwiftUI

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy"
    return formatter
}()


class Transaction: Identifiable {
    var id = UUID()
    var give: String
    var get: String
    var username: String
    var date: Date
    var dateArr: [Int]
    
    init(give: String, get: String, username: String, date: Date = Date()){
        self.give = give
        self.get = get
        self.username = username
        self.date = date
        self.dateArr = []
    }
    init(give: String, get: String, username: String, dateArr: [Int]){
        self.give = give
        self.get = get
        self.username = username
        self.dateArr = dateArr
        
        let calendar = Calendar.current
        let components = DateComponents(calendar: calendar, year: dateArr[2], month: dateArr[1], day: dateArr[0])
        self.date = calendar.date(from: components) ?? Date()
    }
    
    func printDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    func user() -> User {
        print(username)
        let user = users.first(where: { $0.username == self.username }) ?? me
        return user
    }
}
