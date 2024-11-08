import SwiftUI

struct Form: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var transactionStore: TransactionStore
    
    @State private var give = ""
    @State private var get = ""
    @State private var user = ""
    @State var date = Date()
    @State var alert = false
    @State var message = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Save Transaction")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding(.top)
                    .foregroundColor(.accent)
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80)
                    .padding(.bottom)
                
                List{
                    Section{
                        Picker("Book given", selection: $give) {
                            Text("")
                            ForEach(me.has, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                        Picker("Book gotten", selection: $get) {
                            Text("")
                            ForEach(me.want, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    Section{
                        Picker("User", selection: $user) {
                            Text("")
                            ForEach(users.filter { $0.follow }) { user in
                                Text(user.username).tag(user.username)
                            }
                        }
                        .pickerStyle(.navigationLink)
                    }
                    
                    DatePicker(
                        "Date",
                        selection: $date,
                        displayedComponents: [.date]
                    )
                    
                    Section{
                        Button {
                            if(give == ""){
                                alert = true
                                message = "Please select \"Book given\""
                            } else if(get == ""){
                                alert = true
                                message = "Please select \"Book gotten\""
                            } else if(user == ""){
                                alert = true
                                message = "Please select \"User\""
                            } else {
                                let trn = Transaction(give: give, get: get, username: user, date: date)
                                transactionStore.transactions.insert(trn, at: 0)
                                presentationMode.wrappedValue.dismiss()
                            }
                        } label: {
                            HStack{
                                Spacer()
                                Text("Submit")
                                    .font(.headline)
                                    .bold()
                                    .padding(.vertical, 3)
                                    .foregroundColor(.accent)
                                Spacer()
                            }
                        }
                        .alert(isPresented: $alert) {
                            Alert(title: Text("Error"),
                                  message: Text(message),
                                  dismissButton: .default(Text("ok")))
                        }
                    }
                }
            }
        }
    }
}
