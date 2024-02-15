//
//  AppDelegate.swift
//  tour_activities
//
//  Created by Julius Dejon on 2024-02-14.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Handle your deep link here
        if url.scheme == "gbc_tour" {
            // Extract the path and navigate accordingly
            // For example:
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            if let dynamicValue = components.queryItems?.first(where: { $0.name == "dynamicValue" })?.value {
                 // Handle dynamic value here
                 print("Dynamic value: \(dynamicValue)")
             }
            return true
        }
        return false
    }



}
