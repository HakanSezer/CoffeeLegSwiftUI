//
//  CoffeeTimeView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 14.12.2023.
//

import SwiftUI
import UserNotifications

struct CoffeeTimeView: View {
    @ObservedObject var stopWatch = StopWatch()
    @State private var isToggle: Bool = true
    
    var notificationModel = NotificationModel()
    
    var body: some View {
        
        // Dışarıdaki rengi ayarlamak için kullanıyorum.
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.colorTestThree, .colorTestTwo]), startPoint: .top, endPoint: .bottom))
                .ignoresSafeArea()
                .navigationBarTitle("Coffee Timer", displayMode: .large)
            
            // Timer Ayarlamak için kullanıyorum.
            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(.secondary)
                Circle()
                    .trim(from: 0, to: CGFloat(1 - (stopWatch.counter / 600.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .rotation(.degrees(270))
                    .foregroundColor(.brown)
                
                // Circle içerisinde bulunan Sayaç gösteriyor.
                if isToggle {
                    let minutes = String(format: "%02d", Int(stopWatch.counter) / 60)
                    let seconds = String(format: "%02d", Int(stopWatch.counter) % 60)
                    let union = minutes +  " : " + seconds
                    Text("\(union)")
                        .foregroundColor(Color.gray)
                        .font(.custom("", size: 90))
                }
            }
            .frame(maxWidth: 500)
            .padding(20)
            .offset(y:-130)
            
            
            VStack {
                Spacer()
                
                HStack {
                    // Buttonler ve Buttonların dış Hatları.
                    ZStack {
                        Rectangle()
                            .frame(width: 100,height: 50)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                        Button("Start") {
                            isToggle = true
                            self.stopWatch.start()
                            
                        }
                        .foregroundColor(.white)
                        .font(.title2)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 50)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                        Button("Stop") {
                            isToggle = true
                            self.stopWatch.stop()
                            
                        }
                        .background(Color.black)
                        .foregroundColor(.white)
                        .font(.title2)
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 100 , height: 50)
                            .cornerRadius(20)
                            .foregroundColor(.black)
                        Button("Reset") {
                            isToggle = true
                            self.stopWatch.reset()
                        }//: ZStack
                        .foregroundColor(.white)
                        .font(.title2)
                    }
                }
                .padding()
                // Timer süresini ayarlamak için kullanılmıştır.
                Slider(value: $stopWatch.counter, in: 1...600, step: 1)
                    .padding()
                    .frame(width: 300)
              
                Text("Be careful when pouring hot water. \nYou can discover the water pouring time by experimenting. ")
                    .font(.custom("", size: 18))
                    .padding()
            }
        }
    }
}
    #Preview {
        CoffeeTimeView()
 }
