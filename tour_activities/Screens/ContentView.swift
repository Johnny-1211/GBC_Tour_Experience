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
    
//    @State private var favoritesList : Set<DataContent> = []
    
    @State private var showFavorite : Bool = false
    @ObservedObject var viewModel: ViewModel
    
    @Binding var users:[User]
    @Binding var isLoggedIn:Bool
    @Binding var currentUser: User
    
    var body: some View {
        NavigationStack{
            ShowFavoriteToggle(showFavorite: $showFavorite,
                           currentUser: $currentUser)
            
            if showFavorite{ // Press toggle button
                if !currentUser.favoriteTourList.isEmpty{
                    
                    ClearAllButton(currentUser: $currentUser)
                    
                    List{
                        ForEach(self.getTour(searchTerm: self.searchTourName)) { items in
                            VStack{
                                NavigationLink{
                                    TourDetails(tour: items,
                                                currentUser: $currentUser,
                                                viewModel: viewModel
                                    )
                                } label: {
                                    TourListView(tour: items,
                                                 favoritesList: $currentUser.favoriteTourList)
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                        .navigationTitle("Things to do in Toronto")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing){
                            LogoutButton(logout: logout)
                        }
                    }
                    .searchable(text: self.$searchTourName,
                                prompt: "Enter tour name to search")
                    
                }else{
                    EmptyFavoriteListVew(logout: logout)
                }
            }else{ // // Did not press toggle button
                List{
                    ForEach(self.getTour(searchTerm: self.searchTourName)) { items in
                        VStack{
                            NavigationLink{
                                TourDetails(tour: items,
                                            currentUser: $currentUser,
                                            viewModel: viewModel
                                )
                            } label: {
                                TourListView(tour: items,
                                             favoritesList: $currentUser.favoriteTourList)
                            }
                            .navigationTitle("Things to do in Toronto")
                            .navigationBarTitleDisplayMode(.inline)
                            
                        }
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .topBarTrailing){
                        LogoutButton(logout: logout)
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
            
            for item in currentUser.favoriteTourList{
                if (item.name.contains(searchTerm)){
                    resultFavoriteList.append(item)
                }
            }
            return resultFavoriteList
        }else{
            return Array(currentUser.favoriteTourList)
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        let indicesToDelete = Array(offsets)
        var userFavList = currentUser.favoriteTourList
        for index in indicesToDelete {
            let item = userFavList[userFavList.index(userFavList.startIndex, offsetBy: index)]
            userFavList.remove(item)
        }
    }
    
    // Logout action
     private func logout() {
         UserDefaults.standard.removeObject(forKey: "rememberedEmail")
         UserDefaults.standard.removeObject(forKey: "rememberedPassword")
         UserDefaults.standard.set(false, forKey: "isLoggedIn")
         isLoggedIn = false
     }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        @State var users  = [
            User(email: "user1@example.com", password: "password1"),
            User(email: "user2@example.com", password: "password2")
        ]
        @State var isLoggedIn = false
        @State var currentUser = User(email: "user1@example.com", password: "password1")
        return ContentView( viewModel: viewModel, users: $users, isLoggedIn: $isLoggedIn, currentUser: $currentUser)
    }
}
