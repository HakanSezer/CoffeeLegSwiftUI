//
//  NotificationModel.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 7.01.2024.
//

import Foundation
import UserNotifications

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
                requestNotificationPermission()
                print("Bildirimler Açıldı.")
            }
        }
        
        func requestNotificationPermission() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                DispatchQueue.main.async {
                    self.isPermissionGranted = success
                    
                }
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
