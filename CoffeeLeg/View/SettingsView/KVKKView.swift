//
//  KVKKView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 8.01.2024.
//

import SwiftUI

struct KVKKView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.colorTestThree, .colorTestTwo]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
                
                ZStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 0.93, height: UIScreen.main.bounds.width * 1.3)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                        .offset(y: 28)
                    
                    VStack {
                        Text("Privacy Policy")
                            .offset(y: -50)
                            .font(.largeTitle)
                        
                        ScrollView(.vertical, showsIndicators: false) {
                            Text(appPrivarcyPolicy)
                                
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.84, height: UIScreen.main.bounds.height * 0.54)
                    }
                }
            }
        }
    }
}

#Preview {
    KVKKView()
}
