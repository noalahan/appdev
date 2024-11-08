import SwiftUI

struct Login: View {
    
    @State var user = ""
    @State var pass = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigate = false
    
    var body: some View {
        NavigationStack{
            VStack (spacing: 15){
                Spacer()

                Image("logo")
                
                Text("Book Swap")
                    .foregroundStyle(.accent)
                    .font(.title)
                    .bold()
                    .padding(.bottom)
                
                Group{
                    TextField("Username", text: $user)
                    SecureField("Password", text: $pass)
                }
                .padding(10)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled()
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor, lineWidth: 2)
                )
                
                Button {
                    submit()
                } label: {
                    HStack{
                        Text("Login")
                            .foregroundColor(.white)
                            .bold()
                            .padding()
                    }
                    .background(.accent)
                    .cornerRadius(8)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Login"), message: Text(alertMessage), dismissButton: .default(Text("ok")))
                }
                
                Spacer()
                
                NavigationLink {
                    Signin()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Dont have an account?").bold()
                        Text("Sign Up").underline()
                    }
                }
            }
            .padding(.horizontal, 30)
            .navigationDestination(isPresented: $navigate){
                ContentView(selectedTab: 0)
                    .navigationBarBackButtonHidden()
            }
        }
    }
    
    func submit(){
        if user == "user" && pass == "pass"{
            navigate = true
        } else {
            alertMessage = "Invalid username or password."
            showAlert = true
        }
    }
}

#Preview {
    Login()
}
