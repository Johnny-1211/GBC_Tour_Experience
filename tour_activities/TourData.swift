////
////  TourData.swift
////  tour_activities
////
////  Created by Johnny Tam on 8/2/2024.
////
//
import Foundation
//
//
class DataContent:Identifiable, Hashable, Equatable {
    static func == (lhs: DataContent, rhs: DataContent) -> Bool {
        return lhs.id == rhs.id
    }
    
    let name:String
    let price:Double
    let images: [String]
    let description: String
    let rating: Int
    let contact: String
    var isFavorite:Bool = false
    
    init(name: String, price: Double, images: [String], description: String, rating: Int, contact: String) {
        self.name = name
        self.price = price
        self.images = images
        self.description = description
        self.rating = rating
        self.contact = contact
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
    }
}

class TourData : ObservableObject{
    @Published var data:[DataContent]
    
    init(){
        self.data = [
            DataContent(name: "Show Me The City- Toronto Walking Tour",
                        price: 48,
                        images: ["ShowMeTheCity", "ShowMeTheCity2"],
                        description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
                        rating: 4,
                        contact: "555-555-5555"
                       ),
            DataContent(name: "Toronto R&B Sounds Intimate Concerts",
                        price: 48,
                        images: ["Concert", "Concert2"],
                        description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
                        rating: 3,
                        contact: "555-555-5554"
                       ),
            DataContent(name: "Niagara, Maple, Wine & Hike",
                        price: 180,
                        images: ["Niagara", "Niagra2"],
                        description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
                        rating: 2,
                        contact: "555-555-5553"
                       ),
            DataContent(name: "Kensington Market Photography Walk",
                        price: 72,
                        images: ["Kensington", "Kensington2"],
                        description: "On this tour, you'll take a canoe trip to the waterfront of our city and watch the sun set over the city skyline. Basic canoeing instruction provided at the start of the tour. Canoe rental and lifejackets are included in the price.",
                        rating: 3,
                        contact: "555-555-5552"
                       ),
        ]
    }
}
