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
    
    func getPermission() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
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
    
    func sendPushNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Push bildirimi gönderilirken hata oluştu: (error.localizedDescription)")
            } else {
                print("Push bildirimi başarıyla gönderildi.")
            }
        }
    }
    // Settings gider.
    func openAppSettings() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(settingsUrl) else {
            return
        }
        
        if #available(iOS 10.0, *) {
            DispatchQueue.main.async {
                UIApplication.shared.open(settingsUrl)
            }
           
        } else {
            UIApplication.shared.openURL(settingsUrl)
        }
    }
}

/*
class NotificationModel: ObservableObject {
    @Published var isPermissionGranted: Bool = true
    
    /*
     init() {
     checkNotificationPermission()
     }
     
     func checkNotificationPermission() {
     UNUserNotificationCenter.current().getNotificationSettings { settings in
     self.isPermissionGranted = settings.authorizationStatus == .authorized
     }
     }
     */
    
    func toggleNotificationStatus() {
        if !isPermissionGranted {
            print("Bildirimler Kapatıldı.")
        } else {
            askPermission()
            print("Bildirimler Açıldı.")
        }
    }
    
    // Notification için onay almak için kullanılır.
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.isPermissionGranted = true
                
            } else if let error = error {
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.isPermissionGranted = false
                }
            }
        }
    }
    
    
    func sendPushNotification(title: String, body: String) {
        // Notification Shows, how it should look.
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        
        //Notification Request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        //Notification Request Feedback
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Push bildirimi gönderilirken hata oluştu: \(error.localizedDescription)")
            } else {
                print("Push bildirimi başarıyla gönderildi.")
            }
        }
    }
}
*/

