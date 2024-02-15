//
//  User.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import Foundation
import SwiftUI

class User:Identifiable, ObservableObject {

    let id: UUID = UUID()
    @Published var email: String
    @Published var password: String
    @Published var favoriteTourList:Set<DataContent> = []
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }

}
