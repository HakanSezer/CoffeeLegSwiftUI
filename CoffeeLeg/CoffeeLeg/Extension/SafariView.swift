//
//  SafariView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 8.01.2024.
//

import Foundation
import SwiftUI
import SafariServices


// X, Linkedin, instagram.
struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> UIViewController {
        let safariViewController = SFSafariViewController(url: url)
        return safariViewController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Update the view controller when needed
    }
}
