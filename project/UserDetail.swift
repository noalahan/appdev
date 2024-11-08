import SwiftUI

struct UserDetail: View {
    @ObservedObject var user: User
    
    var body: some View {
        VStack() {
            // Title
            HStack{
                VStack(alignment: .leading){
                    Text(user.name).font(.title).bold()
                    Text(user.username).font(.title)
                    Text(String(user.distance) + "km away").padding(.top, 3)
                }
                
                Spacer()
                
                Image(user.image)
                    .resizable()
                    .frame(width: 100, height:100)
                    .clipShape(Circle())
            }.padding()
            
            // Buttons row
            HStack{
                Spacer()
                
                Group{
                    // add friend
                    Button{
                        user.follow.toggle()
                    } label: {
                        Text(user.follow ? "Unfollow" : "Follow")
                    }
                    .frame(width: 150, height: 40)
                    .background(user.follow ? Color.gray : .accent)
                    
                    // contact
                    let newConvo = convos.first(where: { $0.username == user.username }) ?? Convo(name: user.name, username: user.username, image: user.image, messages: [])
                    NavigationLink{
                        ConvoDetail(convo: newConvo)
                    }label: {
                        Text("Message")
                    }
                    .frame(width: 150, height: 40)
                    .background(.accent)
                    
                }
                .foregroundColor(.white)
                .bold()
                .cornerRadius(8)
                
                Spacer()
            }.padding(.bottom, 5)
            
            // Information
            List{
                Section(header: Text("HAS")) {
                    ForEach(user.has, id: \.self) { has in
                        Text(has)
                    }
                }
                
                Section(header: Text("WANT")) {
                    ForEach(user.want, id: \.self) { want in
                        Text(want)
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}
