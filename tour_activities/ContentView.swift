//
//  ContentView.swift
//  tour_activities
//
//  Created by Johnny Tam on 8/2/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var tourList = TourData()
    @State private var updatedTourList = [DataContent]()
    @State private var searchTourName:String = ""
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(self.getTour(searchTerm: self.searchTourName)) { items in
                        VStack{
                            NavigationLink{
                                
                                TourDetails(tour: items)
                            } label: {
                                TourListView(imageName: items.images.first!,
                                             tourName: items.name,
                                             tourprice: items.price)
                            }
                    }
                }
            }
            .searchable(text: self.$searchTourName,
                        prompt: "Enter tour name to search")
            .navigationTitle("Things to do in Toronto")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    private func getTour(searchTerm: String) -> [DataContent]{
        if (searchTerm.isEmpty) {
            return self.tourList.data
        }
        else{
            var resultList : [DataContent] = []
            
            for item in self.tourList.data{
                if (item.name.contains(searchTerm)){
                    resultList.append(item)
                }
            }
            return resultList
        }
    }
    
}

#Preview {
    ContentView()
}


