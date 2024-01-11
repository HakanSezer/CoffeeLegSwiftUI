//
//  TimerData.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 14.12.2023.
//

import Foundation

class StopWatch: ObservableObject {
    @Published var counter: Double = 0
    
    var timer = Timer()
    var notificationModels = NotificationModel()

    
    func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            if self.counter > 0 {
                self.counter -= 1
            }else {
                self.stop()
                if self.notificationModels.isPermissionGranted {
                    self.notificationModels.sendPushNotification(title: "Coffee Time", body: "Your Coffee is Ready!")
                }
            }
        })
    }
    
    func stop() {
        self.timer.invalidate()
    }
    func reset() {
        self.counter = 0
        self.timer.invalidate()
    }
    
}
