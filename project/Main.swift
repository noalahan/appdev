import SwiftUI

struct Main: View {
    
    @State private var searchText = ""
    @State private var filter = 0
    
    var body: some View {
        NavigationView {
            VStack{
                //filter picker
                Picker(selection: $filter) {
                    Text("All").tag(0)
                    Text("Has").tag(1)
                    Text("Want").tag(2)
                } label: {
                    Text("Picker Here")
                }
                .pickerStyle(PalettePickerStyle()).padding(.horizontal)
                .padding(.bottom, 7)
                
                List(searchResults) { user in
                    Section{ NavigationLink(destination: UserDetail(user: user)) {
                        VStack (alignment: .leading){
                            HStack{
                                Image(user.image)
                                    .resizable()
                                    .frame(width: 50, height:50)
                                    .clipShape(Circle())
                                    .overlay(
                                        Circle().stroke(Color.accentColor, lineWidth: 2)
                                    )
                                VStack (alignment: .leading){
                                    Text(user.name).font(.headline)
                                    Text(user.username).foregroundStyle(Color(.accent))
                                }
                            }
                            
                            Text("Distance: " + String(user.distance) + "km away").padding(.top)
                            
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    Text("Has:")
                                    ForEach(user.has, id: \.self) { has in
                                        Text(has).bold(has
                                            .localizedCaseInsensitiveContains(searchText) ? true : false)
                                    }
                                }
                            }
                            
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    Text("Want:")
                                    ForEach(user.want, id: \.self) { want in
                                        Text(want).bold(want.localizedCaseInsensitiveContains(searchText) ? true : false)
                                    }
                                }
                            }
                        }.padding(.vertical)
                    }}
                }
            }
            .navigationTitle("Home")
        }
        .searchable(text: $searchText, prompt: "Look for a book") // makes search bar
    }

    
    var searchResults: [User]{
        if(searchText == ""){
            return users
        } else if(filter == 0){
            return users.filter { user in
                user.has.contains { book in
                    book.localizedCaseInsensitiveContains(searchText)
                } || user.want.contains { book in
                    book.localizedCaseInsensitiveContains(searchText)
                }
            }
        } else if (filter == 1){
            return users.filter { user in
                user.has.contains { book in
                    book.localizedCaseInsensitiveContains(searchText)
                }
            }
        } else {
            return users.filter { user in
                user.want.contains { book in
                    book.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
}

#Preview {
    Main()
}
