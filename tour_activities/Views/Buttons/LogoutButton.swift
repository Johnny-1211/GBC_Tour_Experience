//
//  LogoutButton.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct LogoutButton: View {
    let logout: () -> Void 
    
    var body: some View {
        NavigationLink {
            LoginScreen()
        } label:{
            Button {
                logout()
            }label:{
                Text("Logout")
            }
        }
    }
}

