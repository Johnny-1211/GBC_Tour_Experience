//
//  SaveFavoriteButton.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct SaveFavoriteButton: View {
    @EnvironmentObject var currentUser:User
    @Binding var showAlert :Bool
    var tour : DataContent

    
    var body: some View {
        Button(action: {
//            if (tour.isFavorite) {
//                tour.isFavorite = false
//                currentUser.favoriteTourList.remove(tour)
//            } else {
                tour.isFavorite = true
                currentUser.favoriteTourList.insert(tour)
//            }
            showAlert = true
            
        }) {
            HStack {
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
            }
            
        }
    }
}
