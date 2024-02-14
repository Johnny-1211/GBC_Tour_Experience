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
    @State private var favoritesList : Set<DataContent> = []
    @State private var showFavorite : Bool = false
    
    
    var body: some View {
        NavigationStack{
            Toggle(isOn: $showFavorite, label: {
                Text("Show Favorites (\(favoritesList.count))")
            })
            .padding(.horizontal)
            
            if showFavorite{
                if !favoritesList.isEmpty{
                    VStack {
                        
                        HStack {
                          
                            Button("Clear all") {
                                favoritesList.removeAll()
                            }.padding(.horizontal)
                            Spacer()
                        }
                    }
                    List{
                        ForEach(self.getTour(searchTerm: self.searchTourName)) { items in
                            VStack{
                                NavigationLink{
                                    TourDetails(tour: items,
                                                favoritesList: $favoritesList
                                    )
                                } label: {
                                    TourListView(tour: items)
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                        .navigationTitle("Things to do in Toronto")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    .searchable(text: self.$searchTourName,
                                prompt: "Enter tour name to search")
                    
                }else{
                    VStack{
                        Spacer()
                        Text("Not yet add any favorite tour.")
                        Spacer()
                    }
                    .navigationTitle("Things to do in Toronto")
                    .navigationBarTitleDisplayMode(.inline)
                    Spacer()
                }
            }else{
                List{
                    ForEach(self.getTour(searchTerm: self.searchTourName)) { items in
                        VStack{
                            NavigationLink{
                                TourDetails(tour: items,
                                            favoritesList: $favoritesList
                                )
                            } label: {
                                TourListView(tour: items)
                            }
                            .navigationTitle("Things to do in Toronto")
                            .navigationBarTitleDisplayMode(.inline)
                            
                        }
                    }
                }
                .searchable(text: self.$searchTourName,
                            prompt: "Enter tour name to search")
            }
            
            
            
        }
        
    }
    
    private func getTour(searchTerm: String) -> [DataContent]{
        if (searchTerm.isEmpty && !showFavorite) {
            return self.tourList.data
        }
        else if (!searchTerm.isEmpty && !showFavorite){
            var resultList : [DataContent] = []
            
            for item in self.tourList.data{
                if (item.name.contains(searchTerm)){
                    resultList.append(item)
                }
            }
            return resultList
        }else if (!searchTerm.isEmpty && showFavorite){
            var resultFavoriteList : [DataContent] = []
            
            for item in self.favoritesList{
                if (item.name.contains(searchTerm)){
                    resultFavoriteList.append(item)
                }
            }
            return resultFavoriteList
        }else{
            return Array(favoritesList)
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        let indicesToDelete = Array(offsets)
        for index in indicesToDelete {
            let item = favoritesList[favoritesList.index(favoritesList.startIndex, offsetBy: index)]
            favoritesList.remove(item)
        }
    }
}

#Preview {
    ContentView()
}


