//
//  ContentView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 13.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var seletedTab = 0
  @EnvironmentObject var notificationModel: NotificationModel // EnvironmentObject olarak kullanılıyor

    init() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { allowed, error in
            if allowed {
                // register for remote push notification
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
                print("Push notification allowed by user")
            } else {
                print("Error while requesting push notification permission. Error (error)")
            }
        }
    }
    
    var body: some View {
        
    NavigationView {
        TabView(selection: $seletedTab) {
                HistoryView()
                    .tabItem {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, seletedTab == 0 ? .fill : .none)
                        Text("Home")
                        
                    }
                    .tag(0)
                CoffeeView()
                    .tabItem {
                        Image(systemName: "cup.and.saucer")
                            .environment(\.symbolVariants, seletedTab == 1 ? .fill : .none)
                        Text("Coffee")
                            
                    }
                    .tag(1)
                CoffeeTimeView()
                .tabItem {
                    Image(systemName: "timer")
                        .environment(\.symbolVariants, seletedTab == 2 ? .fill : .none)
                    Text("Timer")
                }
                .tag(2)
            
                SettingsView()
                .tabItem {
                    Image(systemName: "gearshape")
                        .environment(\.symbolVariants, seletedTab == 3 ? .fill : .none)
                    Text("Settings")
                }
                .tag(3)
            }
        .scrollIndicators(.never)
        .tint(.black)
        .onAppear {
                        notificationModel.checkNotificationPermission()
                    }

        
        }
    }
}

#Preview {
    ContentView()
}
