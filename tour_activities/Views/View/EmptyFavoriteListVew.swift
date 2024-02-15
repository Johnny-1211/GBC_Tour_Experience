//
//  EmptyFavoriteListVew.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct EmptyFavoriteListVew: View {
    let logout:() -> Void
    var body: some View {
        VStack{
            Spacer()
            Text("Not yet add any favorite tour.")
            Spacer()
        }
        .navigationTitle("Things to do in Toronto")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                LogoutButton(logout: logout)
            }
        }
        Spacer()
    }
}

