//
//  ImageScrollView.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import SwiftUI

struct ImageScrollView: View {
    var tour: DataContent
    var body: some View {
        ScrollView(.horizontal){
            HStack {
                ForEach(tour.images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(8)
                }
                
            }
        }
    }
}

