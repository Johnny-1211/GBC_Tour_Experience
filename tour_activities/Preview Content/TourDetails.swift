//
//  TourDetails.swift
//  tour_activities
//
//  Created by Julius Dejon on 2024-02-12.
//

import SwiftUI

struct TourDetails: View {
    var tour : DataContent
    var body: some View {
        VStack {
            Text("\(tour.name)").font(.title)
            Text("Price: $\(tour.price) / person").font(.title2)
            Spacer()
            HStack {
                Image(tour.imageName)
                    .resizable()
                    .frame(width: 150,height: 150)
                    .cornerRadius(8)
                Image(tour.imageName)
                    .resizable()
                    .frame(width: 150,height: 150)
                    .cornerRadius(8)
            }
            Spacer()
            Text("\(tour.description)")
            Spacer()
            Text("Contact:")
            Text("\(tour.contact)")
            Spacer()
            HStack {
                Button("SHARE"){
                    
                }
                Button("FAVORITE"){
                    
                }
            }
        }.padding()
    }
}

#Preview {
    TourDetails(tour: DataContent(
       name: "Show Me The City- Toronto Walking Tour",
       price: 48,
       imageName: "ShowMeTheCity",
       description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
       rating: 4,
       contact: "555-555-5555"
     )
    )
}
