
import SwiftUI


struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = UserDefaults.standard.bool(forKey: "rememberMe")
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    @State var users: [User] = [
        User(email: "user1@example.com", password: "password1"),
            User(email: "user2@example.com", password: "password2"),
        User(email: "a", password: "a")
        ]
    
    @ObservedObject var currentUser:User = User(email: "", password: "")
        
    var body: some View {
        NavigationView {
            if isLoggedIn {
                ContentView(viewModel: ViewModel(), users: $users, isLoggedIn: $isLoggedIn).environmentObject(currentUser)
            } else {
                LoginView(email: $email,
                          password: $password,
                          rememberMe: $rememberMe,
                          isLoggedIn: $isLoggedIn,
                          users: $users
                ).environmentObject(currentUser)
            }
        }
    }

}
