//
//  ClearAllButton.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct ClearAllButton: View {
    @Binding var currentUser:User
    
    var body: some View {
        VStack {
            HStack {
                Button("Clear all") {
                    currentUser.favoriteTourList.removeAll()
                }.padding(.horizontal)
                Spacer()
            }
        }
    }
}


