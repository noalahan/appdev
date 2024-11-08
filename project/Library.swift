import SwiftUI

struct Library: View {
    @StateObject var transactionStore = TransactionStore()

    @State var isLibrary = true

    var body: some View {
        NavigationView {
            VStack{
                HStack {
                    Text(isLibrary ? "Library" : "Transactions")
                        .font(.largeTitle.bold())
                    
                    Spacer()
                    
                    if(!isLibrary){
                        NavigationLink {
                            Form(transactionStore: transactionStore)
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .font(.title)
                        }
                    }
                }.padding(.horizontal)
                
                //filter picker
                Picker(selection: $isLibrary) {
                    Text("Library").tag(true)
                    Text("Transactions").tag(false)
                } label: {
                    Text("Picker Here")
                }
                .pickerStyle(PalettePickerStyle()).padding(.horizontal)
                .padding(.bottom, 7)
                
                // Library mode
                if(isLibrary){
                    List{
                        Section(header: Text("HAS")) {
                            ForEach(me.has, id: \.self) { has in
                                Text(has)
                            }
                        }
                        
                        Section(header: Text("WANT")) {
                            ForEach(me.want, id: \.self) { want in
                                Text(want)
                            }
                        }
                    }
                } else {
                    List(transactionStore.transactions) { transaction in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(transaction.give).font(.title3).bold()
                                Spacer()
                                Image(systemName: "arrow.left.arrow.right")
                                Spacer()
                                Text(transaction.get).font(.title3).bold()
                            }
                            
                            HStack {
                                Text("Date:").bold()
                                Text(transaction.printDate())
                            }
                            
                            let user = transaction.user()
                            NavigationLink{
                                UserDetail(user: user)
                            } label: {
                                HStack {
                                    Spacer()
                                    Image(user.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        .overlay(
                                            Circle().stroke(Color.accentColor, lineWidth: 2)
                                        )
                                    VStack(alignment: .leading) {
                                        Text(user.name).font(.headline)
                                        Text(user.username).foregroundStyle(Color(.accent))
                                    }
                                    Spacer()
                                }
                                .frame(width: 270, height: 80)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor, lineWidth: 2)
                                )
                            }
                            
                        }.padding(.vertical)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    Library()
}

