import SwiftUI

struct Signin: View {
        
    @State var user = ""
    @State var pass = ""
    @State var confirmPass = ""
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
                Text("Create Account")
                    .foregroundStyle(.accent)
                    .font(.headline)
                
                Group{
                    TextField("Username", text: $user)
                    SecureField("Password", text: $pass)
                    SecureField("Confirm Password", text: $confirmPass)
                }
                .padding(10)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                .autocorrectionDisabled(true)
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor, lineWidth: 2)
                )
                
                Button{
                    submit()
                } label: {
                    HStack{
                        Text("Sign Up")
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
                .disabled((pass == confirmPass && pass != "") == false)
                .opacity((pass == confirmPass && pass != "") ? 1 : 0.3)
                
                Spacer()
                
                NavigationLink{
                    Login().navigationBarBackButtonHidden()
                } label: {
                    HStack{
                        Text("Already have an account?").bold()
                        Text("Sign In").underline()
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
        if pass == confirmPass && pass != "" && user != ""{
            navigate = true
        } else {
            alertMessage = "Invalid username or password."
            showAlert = true
        }
    }
}

#Preview {
    Signin()
}
