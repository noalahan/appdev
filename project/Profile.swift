import SwiftUI


struct Profile: View {
        
    @State private var followCount = users.filter { $0.follow }.count

    @State private var notifications = true

    @State private var deleteAlert = false
    @State private var delete = false

    @State private var signAlert = false
    @State private var signout = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("PROFILE")) {
                    HStack{
                        Image(me.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.accentColor, lineWidth: 2)
                            )
                            .padding(.vertical, 10)
                        VStack (alignment: .leading){
                            Text(me.name).font(.title)
                            Text(me.username).font(.title2).foregroundStyle(Color(.accent))
                        }
                    }
                    
                    HStack{
                        Text("Age: 25")
                        Spacer()
                        Image(systemName: "lock.fill")
                    }
                    
                    HStack{
                        Text("Zip code: SE5 8UF")
                        Spacer()
                        Image(systemName: "lock.fill")
                    }
                    
                    // follow list
                    NavigationLink{
                        List(users) { user in
                            if user.follow {
                                NavigationLink(destination: UserDetail(user: user)) {
                                    HStack {
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
                                    }
                                }
                            }
                        }
                        .navigationTitle("Following").navigationBarTitleDisplayMode(.large)
                    } label: {
                        HStack{
                            Text("Following:")
                            Text("\(followCount)")
                        }
                    }
                }
                
                Section(header: Text("SETTINGS")) {
                    NavigationLink{
                        Text("Editor would make the app crash! Dummy edit button stayed in its place")
                    } label: {
                        HStack{
                            Text("Edit Profile")
                            Spacer()
                            Image(systemName: "pencil")
                        }
                    }.buttonStyle(.plain)
                    
                    Toggle("Notifications", isOn: $notifications)
                    
                    NavigationLink{
                        Text("Privacy Policy:").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Text("This is not a real app...")
                        Text("It does not get more private than this")
                    } label: {
                        HStack{
                            Text("Privacy Policy")
                            Spacer()
                            Image(systemName: "info.circle.fill")
                        }
                    }
                }
                
                Section(header: Text("DELETE ACCOUNT")) {
                    Button{
                        deleteAlert = true

                    } label: {
                        HStack{
                            Text("Delete Account")
                            Spacer()
                            Image(systemName: "trash.fill")
                        }
                    }
                    .alert("Are you sure you want to delete this account?", isPresented: $deleteAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Delete", role: .destructive) {
                            delete = true
                        }
                    }
                    .navigationDestination(isPresented: $delete){
                        Signin().navigationBarBackButtonHidden()
                    }
                }
                
                Section(header: Text("SIGN OUT")) {
                    Button{
                        signAlert = true
                    } label:{
                        HStack{
                            Text("Sign out")
                            Spacer()
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                    .alert("Are you sure you want to sign out?", isPresented: $signAlert) {
                        Button("Cancel", role: .cancel) {}
                        Button("Sign out", role: .destructive) {
                            signout = true
                        }
                    }
                    .navigationDestination(isPresented: $signout){
                        Login().navigationBarBackButtonHidden()
                    }
                }
                
            }
        }
        .navigationTitle("Profile")
        .refreshable {
            followCount = users.filter { $0.follow }.count
        }
    }
}

#Preview {
    Profile()
}
