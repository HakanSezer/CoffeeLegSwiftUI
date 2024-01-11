//
//  CoffeeAppDelegate.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 10.01.2024.
//

import UIKit
import Foundation
import UserNotifications


// AppDelegate Notificitionç
class AppDelegate: NSObject, UIApplicationDelegate,UNUserNotificationCenterDelegate {
    func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            // Handle authorization result
            if granted {
                print("Bildirim izni verildi.")
            }else if let error = error {
                print("Bildirim izni alınmadı: \(error.localizedDescription)")
            }
        }
        application.registerForRemoteNotifications()
        UNUserNotificationCenter.current().delegate = self

        return true
    }
    func application( _ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenString = deviceToken.reduce("", {$0 + String(format: "%02x", $1)})
        print("Device push notification token - \(tokenString)")
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notification. Error (error)")
    }
    // Uygulama açıkken bildirim alındığında çağrılır
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Bildirimi görüntüleme ayarları
        completionHandler([.banner, .sound, .badge])
        }
}