//
//  historyCoffee.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 13.12.2023.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        // Bu bölümde offseti öğrenmeden önce böyle bir şey yaptı.
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.colorTestThree, .colorTestTwo]), startPoint: .top, endPoint: .bottom))
                    VStack {
                        Image("PhotoCoffee")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: UIScreen.main.bounds.height * 0.4)
                        ZStack {
                            Ellipse()
                                .fill(LinearGradient(gradient: Gradient(colors: [.colorTestThree, .colorTestTwo]), startPoint: .top, endPoint: .bottom))
                            //6.7, 6.1 and 5.5
                                .frame(width: UIScreen.main.bounds.width * 1.3)
                            
                           VStack {
                                Text("History")
                                    .font(.title)
                                    .bold()
                                ScrollView(.vertical, showsIndicators: false) {
                                    Text(History)
                                        .frame(width: UIScreen.main.bounds.width * 0.9)
                                        .padding()
                                }
                            }
                            .offset(y: 40)
                            .padding(.bottom, 125)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HistoryView()
}
