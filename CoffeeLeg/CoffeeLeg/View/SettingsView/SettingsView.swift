//
//  SettingsView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 7.01.2024.
//

import SwiftUI

struct SettingsView: View {
  
  @EnvironmentObject var notificationModel: NotificationModel // EnvironmentObject olarak kullanılıyor
  
  
  @State private var isMail = false
  @State private var isInstagram = false
  @State private var isTwitter = false
  
  var body: some View {
    NavigationView {
      ZStack {
        List() {
          Section(header: Text("Notifications")) {
            Toggle(isOn: $notificationModel.isPermissionGranted) {
              Text("Enable Notifications")

            }
            .onChange(of: notificationModel.isPermissionGranted) { newValue in
              if !newValue {
                // Kullanıcı Toggle'ı kapattığında, Ayarlar sayfasına yönlendir
                notificationModel.openAppSettings()
              }

            }
          }

          Section(header: Text("Policy")) {
            NavigationLink(destination: KVKKView()) {
              Text("Privacy Policy")
            }
          }
          
          Section(header: Text("Contact")) {
            contactItem(imageName: "Mail", text: "Mail", action: {
              isMail.toggle()
            })
            
            contactItem(imageName: "twittericon", text: "Twitter", action: {
              isTwitter.toggle()
            })
            
            contactItem(imageName: "instagram", text: "Instagram", action: {
              isInstagram.toggle()
            })
          }
          
        }
        .preferredColorScheme(.light)
      }
      .navigationTitle("Settings")
    }
    .onAppear {
                // Ayarlar sayfasına her dönüldüğünde bildirim izin durumunu kontrol et
                notificationModel.checkNotificationPermission()
            }
    .sheet(isPresented: $isMail) {
      MailComposeView()
    }
    .sheet(isPresented: $isInstagram) {
      SafariView(url: URL(string: "https://instagram.com/hakansezer1")!)
    }
    .sheet(isPresented: $isTwitter) {
      SafariView(url: URL(string: "https://twitter.com/hakansezr1")!)
    }
  }
  
  // Social on Tap Gesture
  func contactItem(imageName: String, text: String, action: @escaping () -> Void) -> some View {
    HStack {
      Image(imageName)
        .resizable()
        .scaledToFit()
        .frame(width: 40)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
          action()
        }
      
      Text(text)
        .bold()
        .onTapGesture {
          action()
        }
    }
  }
  func checkNotificationPermission() {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      DispatchQueue.main.async {
        notificationModel.isPermissionGranted = settings.authorizationStatus == .authorized
        if settings.authorizationStatus == .denied {
          // Kullanıcıya bildirim izinlerini Ayarlar'dan açması için bir uyarı göster
          // ve openAppSettings fonksiyonunu çağırarak Ayarlar'a yönlendir
        }
        // Diğer durumlar için ek mantık burada olabilir
      }
    }
  }
}


#Preview {
  SettingsView()
}
