import SwiftUI

class User: ObservableObject, Identifiable {
    var id = UUID()
    var name: String
    var username: String
    var image: String
    var distance: Int
    var has: [String]
    var want: [String]
    @Published var follow: Bool
    
    init(name: String, username: String, image: String, distance: Int, has: [String] = [], want: [String] = [], follow: Bool) {
        self.name = name
        self.username = username
        self.image = image
        self.distance = distance
        self.has = has
        self.want = want
        self.follow = follow
    }
    
    func followCount(userList: [User]) -> Int {
        return userList.filter { $0.follow }.count
    }
}

let users: [User] = [
    User(name: "Sherlock Holmes",
         username: "@detective",
         image: "SherlockHolmes",
         distance: 5,
         has: ["Ulysses", "The Odyssey", "The Iliad", "Don Quixote", "Crime and Punishment", "The Brothers Karamazov"],
         want: ["The Divine Comedy", "The Hobbit", "Harry Potter and the Sorcerer's Stone", "The Lord of the Rings", "A Tale of Two Cities", "Great Expectations", "Oliver Twist"],
         follow: false),
    User(name: "William Shakespeare",
         username: "@bard_of_avon",
         image: "WilliamShakespear",
         distance: 7,
         has: ["The Kite Runner", "Life of Pi", "The Alchemist", "The Catcher in the Rye", "1984"],
         want: ["To Kill a Mockingbird", "The Great Gatsby", "War and Peace", "Hamlet", "Moby Dick", "Brave New World", "Pride and Prejudice"],
         follow: true),
    User(name: "John Doe",
         username: "@mr_doe",
         image: "JohnDoe",
         distance: 12,
         has: ["The Great Gatsby", "1984", "To Kill a Mockingbird", "The Catcher in the Rye", "Pride and Prejudice", "The Hobbit"],
         want: ["War and Peace", "Moby Dick", "The Odyssey", "The Iliad", "Hamlet", "Macbeth", "Othello"],
         follow: false),
    User(name: "Jane Austen",
         username: "@prideprejudice",
         image: "JaneAusten",
         distance: 105,
         has: ["Crime and Punishment", "The Brothers Karamazov", "Anna Karenina", "The Master and Margarita"],
         want: ["The Picture of Dorian Gray", "Brave New World", "Fahrenheit 451", "The Road"],
         follow: true),
    User(name: "Juliet Capulet",
         username: "@rose123",
         image: "JulietCapulet",
         distance: 1830,
         has: ["Ulysses", "Infinite Jest", "Gravity's Rainbow"],
         want: ["One Hundred Years of Solitude", "Love in the Time of Cholera", "The Sound and the Fury", "Absalom, Absalom!", "Light in August", "The Sound and the Fury", "Anna Karenina"],
         follow: true),
   User(name: "Mark Twain",
         username: "@huck_finn",
         image: "MarkTwain",
         distance: 5340,
         has: ["The Great Gatsby", "Moby Dick", "War and Peace", "Hamlet"],
         want: ["The Catcher in the Rye", "The Great Gatsby", "Brave New World", "Jane Eyre", "Wuthering Heights"],
        follow: false),
    User(name: "Atticus Finch",
         username: "@mockingbirds",
         image: "AtticusFinch",
         distance: 6830,
         has: ["Don Quixote", "The Divine Comedy"],
         want: ["To Kill a Mockingbird", "1984", "Pride and Prejudice"],
         follow: true),
    ]


let me: User = User(name: "Wanda Maximoff",
                    username: "@ScarletWitch",
                    image: "WandaMaximoff",
                    distance: 0,
                    has: ["Crime and Punishment", "The Brothers Karamazov", "Anna Karenina", "To Kill a Mockingbird", "The Catcher in the Rye"],
                    want: ["The Picture of Dorian Gray", "Fahrenheit 451", "The Road", "One Hundred Years of Solitude", "Moby Dick", "Ulysses", "Life of Pi"],
                    follow: true)
