import SwiftUI

struct Login: View {
    
    @State var user = ""
    @State var pass = ""
    
    var body: some View {
        NavigationStack{
            VStack (spacing: 15){
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
                .autocapitalization(.none)
                .autocorrectionDisabled()
                .overlay(
                    RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor, lineWidth: 2)
                )
                
                Button{
                    submit()
                    print("hello world")
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
                
                NavigationLink {
                    
                } label: {
                    Text("Sign Up").foregroundStyle(Color(.accent)).underline()
                }
            }
            .padding(.horizontal, 30)
        }
    }
    
    private func submit(){
        print("hello world")
        if user == "user" && pass == "pass"{
            print("nice!")
        } else {
            print("womp womp")
        }
    }
}

#Preview {
    Login()
}
