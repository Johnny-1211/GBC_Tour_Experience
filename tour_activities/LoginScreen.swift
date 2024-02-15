//
//  LoginScreen.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

class User {
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

// User authentication service for demo purposes
class AuthenticationService {
    private let users: [User] = [
        User(email: "user1@example.com", password: "password1"),
        User(email: "user2@example.com", password: "password2")
    ]
    
    func login(email: String, password: String) -> Bool {
        return users.contains { $0.email == email && $0.password == password }
    }
}

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = UserDefaults.standard.bool(forKey: "rememberMe")
    @State private var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    
    private let authService = AuthenticationService()
    
    var body: some View {
        NavigationView {
            if isLoggedIn {
                WelcomeView(logoutAction: {
                    UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    UserDefaults.standard.set(false, forKey: "rememberMe")
                    self.email = ""
                    self.password = ""
                    self.isLoggedIn = false
                })
            } else {
                loginView
                    .navigationTitle("Login")
                    .navigationBarHidden(true)
            }
        }
    }
    
    var loginView: some View {
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
                
                Toggle(isOn: $rememberMe) {
                    Text("Remember Me")
                }
                .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            .padding(.horizontal)
            
            Button(action: loginAction) {
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
    }
    
    func loginAction() {
        // Form validation can be enhanced as needed
        if authService.login(email: email, password: password) {
            isLoggedIn = true
            UserDefaults.standard.set(rememberMe, forKey: "rememberMe")
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
}

struct WelcomeView: View {
    var logoutAction: () -> Void
    
    var body: some View {
        VStack {
            Text("Welcome to the Tourism Experience App!")
                .font(.title)
                .padding()
            Button("Logout", action: logoutAction)
        }
    }
}

#Preview {
    LoginScreen()
}
