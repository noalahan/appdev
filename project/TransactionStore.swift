import SwiftUI
import Combine

class TransactionStore: ObservableObject {
    @Published var transactions: [Transaction] = [
        Transaction(
            give: "To Kill a Mockingbird",
            get: "Life of Pi",
            username: "@bard_of_avon"
        ),
        Transaction(
            give: "The Catcher in the Rye",
            get: "Moby Dick",
            username: "@huck_finn",
            dateArr: [4, 5, 2023]
        ),
        Transaction(
            give: "Anna Karenina",
            get: "Ulysses",
            username: "@rose123",
            dateArr: [8, 7, 2024]
        )
    ]
}
