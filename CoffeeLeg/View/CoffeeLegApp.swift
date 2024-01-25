//
//  CoffeeLegApp.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 13.12.2023.
//

import SwiftUI
import UserNotifications
import UIKit

@main
struct CoffeeLegApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appDelegate.notificationModel)
            //Dark mode off
                .preferredColorScheme(.light)
        }
    }
}

