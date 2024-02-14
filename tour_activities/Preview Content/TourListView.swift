//
//  TourListView.swift
//  tour_activities
//
//  Created by Johnny Tam on 9/2/2024.
//

import Foundation
import SwiftUI

struct TourListView: View {
    let tour:DataContent
      
    var body: some View {
        HStack{
            Image(tour.images.first!)
                .resizable()
                .frame(width: 80,height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading){
                Text(tour.name)
                    .font(.title3)
                    .bold()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("Price: $\(String(tour.price))/ person")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: tour.isFavorite ? "heart.fill" : "heart")
        }
    }
}
