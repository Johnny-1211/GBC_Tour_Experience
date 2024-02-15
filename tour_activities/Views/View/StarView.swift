//
//  StarView.swift
//  tour_activities
//
//  Created by Julius Dejon on 2024-02-15.
//

import SwiftUI

struct StarView: View {
    var starType: String
    var body: some View {
        Image(systemName: starType)
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.yellow)
    }
}
