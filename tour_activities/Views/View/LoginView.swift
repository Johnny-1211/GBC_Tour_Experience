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
    @State var showAlert: Bool = false
    @State var errorMessage: String = ""
    @EnvironmentObject var currentUser:User
    
    
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                
                Image("appstore")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
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
                        showAlert = true
                        errorMessage = "Invalid credentials"
                        
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
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("\(errorMessage)"), dismissButton: .default(Text("OK")))
            }
        }
    }
    private func validateLogin() -> Bool {
        for user in users {
            if user.email == email && user.password == password {
                currentUser.email = user.email
                currentUser.password = user.password
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
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
    }
    
}

