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
        NavigationView {
            VStack(alignment: .leading){
                
                HStack {
                    ForEach(tour.images, id: \.self) { image in
                        Image(image)
                            .resizable()
                            .cornerRadius(8)
                    }
                    
                }
                
                HStack(alignment: .top){
                    Text("\(tour.name)").font(.title2).bold()
                    Spacer()
                    Text("$\(String(format: "%.2f", tour.price))/person").font(.headline).fontWeight(.medium)
                }.padding(.top)
                
                HStack(spacing: 10) {
                    ForEach(1...5, id: \.self) { index in
                        let starType = index > tour.rating ? "star" : "star.fill"
                        Image(systemName: starType)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.yellow)
                    }
                    Text("(\(tour.rating))")
                }
                
                Text("Description").font(.title3).fontWeight(.medium).padding(.top)
                Text("\(tour.description)").font(.body)
                HStack {
                    Text("Contact").font(.title3)
                }.padding(.top)
                
                Text("\(tour.contact)").font(.body).padding(.bottom)
                Spacer()
            }.padding()
        }
        .navigationBarItems(trailing:
                                HStack(spacing: 16) {
            Button(action: {
                // Action for the SHARE button
                print("SHARE tapped")
            }) {
                HStack {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                }
            }
            
            Button(action: {
                // Action for the FAVORITE button
                print("FAVORITE tapped")
            }) {
                HStack {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                }
            }
        }
        )
    }
}

#Preview {
    TourDetails(tour: DataContent(
        name: "Show Me The City- Toronto Walking Tour",
        price: 48,
        images: ["ShowMeTheCity", "ShowMeTheCity2"],
        description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
        rating: 4,
        contact: "555-555-5555"
    )
    )
}
