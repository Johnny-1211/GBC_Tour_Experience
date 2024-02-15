

import Foundation
import SwiftUI

struct TourListView: View {
    let tour:DataContent
    @Binding var favoritesList : Set<DataContent>

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
            Image(systemName: favoritesList.contains { $0.id == tour.id && $0.isFavorite == tour.isFavorite } ? "heart.fill" : "heart")
        }
    }
}
