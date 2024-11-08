import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            Main().tabItem {
                Label("Main", systemImage: "book")
            }
            Chat().tabItem{
                Label("Chat", systemImage: "bubble")
            }
            Library().tabItem{
                Label("Library", systemImage: "books.vertical")
            }
            Profile().tabItem {
                Label("Profile", systemImage: "person.crop.circle")
            }
            
        }
    }
}


#Preview {
    ContentView()
}
