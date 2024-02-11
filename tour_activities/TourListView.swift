//
//  TourListView.swift
//  tour_activities
//
//  Created by Johnny Tam on 9/2/2024.
//

import Foundation
import SwiftUI

struct TourListView: View {
    let imageName:String
    let tourName:String
    let tourprice:Double
    var body: some View {
        HStack{
            Image(imageName)
                .resizable()
                .frame(width: 80,height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading){
                Text(tourName)
                    .font(.title3)
                    .bold()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text("Price: $\(String(tourprice))/ person")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    
            }
        }
    }
}
