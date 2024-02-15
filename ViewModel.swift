//
//  ViewModel.swift
//  tour_activities
//
//  Created by Julius Dejon on 2024-02-14.
//

import UIKit

protocol OpenURLProtocol {
    func open(_ url: URL)
}

extension UIApplication: OpenURLProtocol {
    func open(_ url: URL) {
        open(url, options: [:], completionHandler: nil)
    }
}

final class ViewModel: ObservableObject {
    let openURL: OpenURLProtocol
    init(openURL: OpenURLProtocol = UIApplication.shared) {
        self.openURL = openURL
    }
    func callNumber(phoneNumber: String) {
        guard let url = URL(string: "tel://\(phoneNumber)") else { return }
        print("url: \(url)")
        openURL.open(url)
    }
}
