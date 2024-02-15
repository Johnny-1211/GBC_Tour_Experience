//
//  LoginView.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct LoginView: View {
    @Binding var email : String
    @Binding var password :String
    @Binding var rememberMe:Bool
    @Binding var isLoggedIn:Bool
    @Binding var users: [User]
    @Binding var currentUser:User
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 40)
                
                VStack(spacing: 15) {
                    TextField("Enter an email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    SecureField("Enter password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    Toggle(isOn: $rememberMe) {
                        Text("Remember Me")
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                }
                .padding(.horizontal)
                
                Button{
                    if validateLogin() {
                        isLoggedIn = true
                        if rememberMe {
                            rememberUser()
                        }
                    } else {
                        // Show an alert for invalid credentials
                        // Implement your own error handling logic
                        print("Invalid credentials")
                    }
                } label: {
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Login")
            .navigationBarHidden(true)
        }
    }
    private func validateLogin() -> Bool {
        for user in users {
            if user.email == email && user.password == password {
                currentUser = user
                email = ""
                password = ""
                return true
            }
        }
        return false
    }
    
    // Remember user if "Remember Me" option is enabled
    private func rememberUser() {
        UserDefaults.standard.set(email, forKey: "rememberedEmail")
        UserDefaults.standard.set(password, forKey: "rememberedPassword")
    }
    
    // Automatic login if rememberMe is enabled and valid credentials are found
    private func autoLogin() {
        if let rememberedEmail = UserDefaults.standard.string(forKey: "rememberedEmail"),
           let rememberedPassword = UserDefaults.standard.string(forKey: "rememberedPassword") {
            for user in users {
                if user.email == rememberedEmail && user.password == rememberedPassword {
                    isLoggedIn = true
                    email = rememberedEmail
                    password = rememberedPassword
                    break
                }
            }
        }
    }
}


//#Preview {
//    @State var email : String = "user1@gmail.com"
//    @State var password :String = "password1"
//    @State var rememberMe:Bool = false
//    @State var isLoggedIn:Bool = false
//    @State var users: [User] = [
//        User(email: "user1@example.com", password: "password1"),
//        User(email: "user2@example.com", password: "password2")
//    ]
//    return LoginView(email: $email,
//              password: $password,
//              rememberMe: $rememberMe,
//              isLoggedIn: $isLoggedIn,
//              users: $users)
//}
