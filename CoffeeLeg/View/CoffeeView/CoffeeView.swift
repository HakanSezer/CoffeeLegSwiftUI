//
//  coffeeView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 13.12.2023.
//

import SwiftUI

struct CoffeeView: View {
    let coffee: [CoffeLegModel] = Bundle.main.decode("coffeeJS.json")
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.colorTestThree, .colorTestTwo]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
                List(coffee, id:\.name) { coffee in
                    NavigationLink {
                        CoffeeDetailView(coffee: coffee)
                    } label: {
                        HStack {
                            Image(coffee.image)
                                .resizable()
                                .frame(width: 60,height: 60)
                            
                            VStack(alignment: .leading) {
                                Text(coffee.name)
                                    .font(.title2)
                                Text(coffee.sertlik)
                                    .font(.title3)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .preferredColorScheme(.light)
                .cornerRadius(20)
                .padding()
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Coffee", displayMode: .large)
        }
    }
}
#Preview {
    CoffeeView()
}
