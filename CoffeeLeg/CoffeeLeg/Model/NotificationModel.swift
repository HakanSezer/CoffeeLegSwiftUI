//
//  NotificationModel.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 7.01.2024.
//

import Foundation
import UserNotifications
import SwiftUI

class NotificationModel: ObservableObject {
  @Published var isPermissionGranted: Bool = false

  init() {
    checkNotificationPermission()
  }

  func checkNotificationPermission() {
         UNUserNotificationCenter.current().getNotificationSettings { settings in
             DispatchQueue.main.async {
                 self.isPermissionGranted = (settings.authorizationStatus == .authorized)
             }
         }
     }




  func toggleNotificationStatus() {
    if isPermissionGranted {
      // Bildirim izni kapatıldı.
      print("Bildirimler Kapatıldı.")
      openAppSettings()
      // Burada kullanıcı arayüzünü güncellemek veya başka bir işlem yapmak isteyebilirsiniz.
    } else {
      // Bildirim izni isteniyor.
      openAppSettings()
      requestNotificationPermission()
    }
  }


  func requestNotificationPermission() {
          UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
              DispatchQueue.main.async {
                  self.isPermissionGranted = granted
              }
          }
      }

  // Notification için onay almak için kullanılır.
  func askPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
      if success {
        self.isPermissionGranted = success

      } else if let error = error {
        DispatchQueue.main.async {
          print(error.localizedDescription)
          self.isPermissionGranted = false
        }
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
        print("Push bildirimi gönderilirken hata oluştu: \(error.localizedDescription)")
      } else {
        print("Push bildirimi başarıyla gönderildi.")
      }
    }
  }

  func openAppSettings() {
      guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(settingsUrl) else {
          return
      }

      if #available(iOS 10.0, *) {
          UIApplication.shared.open(settingsUrl)
      } else {
          UIApplication.shared.openURL(settingsUrl)
      }
  }

}

