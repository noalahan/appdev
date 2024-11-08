import SwiftUI

struct ConvoDetail: View {
    var convo: Convo
    
    @State private var newMessage = ""
    
    var body: some View {
        ZStack{
            // chat messages
            ScrollView {
                ForEach(convo.messages) { message in
                    HStack {
                        if message.user {
                            Spacer()
                        }
                        Text(message.text)
                            .padding(10)
                            .background(message.user ? Color.accentColor : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        if !message.user {
                            Spacer()
                        }
                    }
                }
                                
                Text("spacer")
                    .padding(10)
                    .opacity(0)
            }.defaultScrollAnchor(.bottom)
            
            // text box
            VStack{
                Spacer()

                HStack {
                    TextField("Type a message...", text: $newMessage)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8).stroke(Color.accentColor, lineWidth: 2)
                        )
                    
                    Button{
                        if(convo.messages.count == 0){
                            convo.addToConvoList()
                        }
                        if(newMessage != ""){
                            let message = Message(text: newMessage, user: true)
                            convo.messages.append(message)
                            newMessage = ""
                        }
                    } label: {
                        Text("Send")
                    }
                    .foregroundColor(.white)
                    .bold()
                    .padding(10)
                    .background(.accent)
                    .cornerRadius(8)
                }
            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(convo.image)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Text(convo.name)
                        .font(.headline)
                }
            }
        }.padding()
    }
}
