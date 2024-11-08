import SwiftUI


struct Message: Identifiable {
    var id = UUID()
    var text: String
    var user: Bool
}

class Convo: ObservableObject, Identifiable {
    var id = UUID()
    var name: String
    var username: String
    var image: String
    @Published var messages: [Message]

    init(name: String, username: String, image: String, messages: [Message] = []) {
        self.name = name
        self.username = username
        self.image = image
        self.messages = messages
    }
    
    func addToConvoList(){
        convos.insert(self, at: 0)
    }
}

var convos: [Convo] = [
    Convo(name: "John Doe",
          username: "@mr_doe",
          image: "JohnDoe",
          messages: [
            Message(text: "Hey John how goes it? I like your book list", user: true),
            Message(text: "I was hoping to get some recommendations?", user: true),
            Message(text: "Hi ofc! I recently read The Great Gatsby... It's a classic!", user: false),
            Message(text: "Also To Kill a Mockingbird is another must-read", user: false),
            Message(text: "I'll have to check them out. Any other recs?", user: true),
            Message(text: "None at the moment but I've enjoyed all the ones on my book list so feel free to use those as recommendations", user: false),
            Message(text: "Great! Thanks mate", user: true),
            Message(text: "Anytime let me know how you're finding them", user: false),
        ]

    ),
    Convo(name: "Jane Austen",
          username: "@prideprejudice",
          image: "JaneAusten",
          messages: [
            Message(text: "Hi there!", user: true),
            Message(text: "Hello!", user: false),
            Message(text: "Just wanted to say big fun of your work", user: true),
            Message(text: "Thats all have a lovely day", user: true),
            Message(text: "Awe that's so sweet", user: false),
            Message(text: ":)", user: true),
          ]
         ),
]
