//
//  TourDetails.swift
//  tour_activities
//
//  Created by Julius Dejon on 2024-02-12.
//

import SwiftUI

struct TourDetails: View {
    var tour : DataContent
    @EnvironmentObject var currentUser : User
    @State private var showAlert = false
    @ObservedObject var viewModel: ViewModel


    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                
                ImageScrollView(tour: tour)
                
                HStack(alignment: .top){
                    Text("\(tour.name)").font(.title2).bold()
                    Spacer()
                    Text("$\(String(format: "%.2f", tour.price))/person").font(.headline).fontWeight(.medium)
                }.padding(.top)
                
                HStack(spacing: 10) {
                    ForEach(1...5, id: \.self) { index in
                        let starType = index > tour.rating ? "star" : "star.fill"
                        StarView(starType: starType)
                    }
                    Text("(\(tour.rating))")
                }
                
                Text("Description").font(.title3).fontWeight(.medium).padding(.top)
                Text("\(tour.description)").font(.body)
                
                Text("Hosted by").font(.title3).fontWeight(.medium).padding(.top)
                Text("\(tour.host)").font(.body)
                
                HStack {
                    Text("Contact").font(.title3).fontWeight(.medium)
                }.padding(.top)
                
                Button("\(tour.contact)") {
                    viewModel.callNumber(phoneNumber: tour.contact)
                }.font(.body).padding(.bottom)
                Spacer()
            }.padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Success"), message: Text("\(tour.isFavorite ? "Added to" : "Removed from") Favorites"), dismissButton: .default(Text("OK")))
                }
        }
        
        .navigationBarItems(trailing:
                                HStack(spacing: 16) {
            
            let dynamicValue = tour.id
            let deepLinkURL = URL(string: "gbc_tour//\(dynamicValue)")!
            
            ShareLink(
                item: deepLinkURL,
                preview: SharePreview(
                    "\(tour.name) - $\(String(format: "%.2f", tour.price))",
                    image: Image("AppIcon")
                )
            )
            
            SaveFavoriteButton(showAlert: $showAlert, tour: tour).environmentObject(currentUser)
            }
        )
    }
}

//#Preview {
//    TourDetails(tour: DataContent(
//        name: "Show Me The City- Toronto Walking Tour",
//        price: 48,
//        images: ["ShowMeTheCity", "ShowMeTheCity2"],
//        description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
//        rating: 4,
//        contact: "555-555-5555")
//    )
//}
