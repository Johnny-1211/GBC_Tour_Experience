//
//  FavoriteToggle.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct ShowFavoriteToggle: View {
    @Binding var showFavorite:Bool
    @EnvironmentObject var currentUser:User
    
    var body: some View {
        Toggle(isOn: $showFavorite, label: {
            Text("Show Favorites (\(currentUser.favoriteTourList.count))")
        })
        .padding(.horizontal)
    }
}


