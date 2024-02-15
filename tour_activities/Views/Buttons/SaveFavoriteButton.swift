//
//  SaveFavoriteButton.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct SaveFavoriteButton: View {
    @Binding var currentUser:User
    @Binding var showAlert :Bool
    var tour : DataContent

    
    var body: some View {
        Button(action: {
            if (tour.isFavorite) {
                tour.isFavorite = false
                currentUser.favoriteTourList.remove(tour)
            } else {
                tour.isFavorite = true
                currentUser.favoriteTourList.insert(tour)
            }
            showAlert = true
            
        }) {
            HStack {
                Image(systemName: currentUser.favoriteTourList.contains { $0.id == tour.id && $0.isFavorite == tour.isFavorite } ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
            }
            
        }
    }
}
