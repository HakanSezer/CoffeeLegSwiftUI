//
//  NotificationModel.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 7.01.2024.
//

import Foundation
import UserNotifications
import UIKit

class NotificationModel: ObservableObject {
    private var notifCompletion: ((Bool) -> Void)?
    
    func checkPermissions(completion: @escaping (Bool) -> Void) {
        notifCompletion = completion
    }
    
    //Push Notification Triggering.
    func getPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            //Toggle Enable Notification for configration
            switch settings.authorizationStatus {
            case .notDetermined:
                self.notifCompletion?(false)
            case .denied:
                self.notifCompletion?(false)
            case .authorized:
                self.notifCompletion?(true)
            case .provisional:
                self.notifCompletion?(true)
            case .ephemeral:
                self.notifCompletion?(false)
            }
        }
    }
     
    /*
    // Notification için onay almak için kullanılır.
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                //                notifCompletion?(true)
            } else if let error = error {
                //                notifCompletion?(true)
            }
        }
    }
    */
    func askPermission() {
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
    
    // Push Notification Text
    func sendPushNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { error in
            //if error = error
            if error != nil {
                print("Push bildirimi gönderilirken hata oluştu: (error.localizedDescription)")
            } else {
                print("Push bildirimi başarıyla gönderildi.")
            }
        }
    }
    //UIKit
    // Settings gider.
    func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(settingsUrl) else {
            return
        }
        // iOS 10 down
        if #available(iOS 10.0, *) {
            DispatchQueue.main.async {
                UIApplication.shared.open(settingsUrl)
            }
           
        } else {
            UIApplication.shared.openURL(settingsUrl)
        }
    }
}


