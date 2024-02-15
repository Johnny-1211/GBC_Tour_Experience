//
//  User.swift
//  tour_activities
//
//  Created by Johnny Tam on 15/2/2024.
//

import Foundation
import SwiftUI

class User:Identifiable{

    let id: UUID = UUID()
    let email: String
    let password: String
    var favoriteTourList:Set<DataContent> = []
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }

}
