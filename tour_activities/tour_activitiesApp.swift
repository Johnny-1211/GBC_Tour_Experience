//
//  tour_activitiesApp.swift
//  tour_activities
//
//  Created by Johnny Tam on 8/2/2024.
//

import SwiftUI

@main
struct tour_activitiesApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate // or SceneDelegate

    var body: some Scene {
        WindowGroup {
//            let viewModel = ViewModel() // Create an instance of ViewModel
            LoginScreen()
        }
    }
}
