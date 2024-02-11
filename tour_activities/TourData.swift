//
//  TourData.swift
//  tour_activities
//
//  Created by Johnny Tam on 8/2/2024.
//

import Foundation


struct DataContent:Identifiable , Hashable {
    let id:UUID = UUID()
    let name:String
    let price:Double
    let imageName:String
}

struct TourData{
    var data:[DataContent]
    
    init(){
        self.data = [
            DataContent(name: "Show Me The City- Toronto Walking Tour",
                        price: 48,
                        imageName: "ShowMeTheCity"),
            DataContent(name: "Toronto R&B Sounds Intimate Concerts",
                        price: 48,
                        imageName: "Concert"),
            DataContent(name: "Niagara, Maple, Wine & Hike",
                        price: 180,
                        imageName: "Niagara"),
            DataContent(name: "Kensington Market Photography Walk",
                        price: 72,
                        imageName: "Kensington"),
        ]
    }
}
