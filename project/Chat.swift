import SwiftUI

struct Chat: View {
    var body: some View {
        NavigationView {
            List(convos) { convo in
                NavigationLink(destination: ConvoDetail(convo: convo)) {
                    HStack{
                        Image(convo.image)
                            .resizable()
                            .frame(width: 50, height:50)
                            .clipShape(Circle())
                        VStack (alignment: .leading){
                            Text(convo.name).font(.headline)
                            HStack{
                                Text(convo.messages.last?.text ?? "")
                                    .italic()
                                    .frame(width: 200, height: 10, alignment: .leading)
                                    .truncationMode(.tail)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Messages")
        }
    }
}

#Preview {
    Chat()
}
