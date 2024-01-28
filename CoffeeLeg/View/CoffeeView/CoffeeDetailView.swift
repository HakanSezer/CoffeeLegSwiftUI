//
//  CoffeeDetailView.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 17.12.2023.
//

import SwiftUI

struct CoffeeDetailView: View {
    
    let coffee: CoffeLegModel
    
    var body: some View {
        NavigationView {
            ZStack {
                // Backroaund Color
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.colorTestThree, .colorTestTwo]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
                
                VStack {
                    Image("coffee")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 1,height: UIScreen.main.bounds.height * 0.3)
                        .ignoresSafeArea()
                        
                    
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width * 0.91)
                            Image("\(coffee.image)")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: UIScreen.main.bounds.width * 0.34,height: UIScreen.main.bounds.height * 0.2)
                                //.frame(width: 160, height: 160)
                                
                        }.offset(y: -135)
                      
                            VStack {
                                Text(coffee.name)
                                    .font(.title)
                                Text(coffee.sertlik)
                                    .foregroundColor(.secondary)
                            }
                            .offset(y: -130)
                        }
                   
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(coffee.aciklama)
                            .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.33)
                    .offset(y: -130)
                }
            }
        }
    }
}

#Preview {
    CoffeeDetailView(coffee: CoffeLegModel(id:"Espresso" , name:"Espresso" , sertlik: "Middle", aciklama:  "Espresso is a dense and concentrated type of coffee. A term of Italian origin, espresso means quickly or immediately. This type of coffee is made from coffee beans ground using pressurized water.\r \rHere are the general steps in making an espresso:\rBean Selection and Grinding:\r \rTo make a quality espresso, fresh coffee beans should be selected and ground just before use. Finely ground coffee is usually used.\r \rDosage: About 7 to 9 grams of coffee is usually used for a standard espresso shot.\r \rPressing (Tamping): The ground coffee is placed in the portafilter of the espresso machine and compressed (pressed) using a special tool. This step ensures that the coffee comes out homogeneously under the pressure of the water.\r \rUsing the Espresso Machine:\r \rThe portafilter is placed in the espresso machine and water is passed through the beans under high pressure. This results in a dense, aromatic coffee in a short time.\r \rExtraction:\r \rEspresso is usually extracted over a period of between 25 and 30 seconds. This time can vary depending on the type of bean, the degree of grinding and the machine used.\r \rIn conclusion, espresso is a type of coffee with a small volume, an intense flavor profile and is usually drunk in a single sip. It is also used as a base ingredient in many coffee drinks, such as cappuccino and latte.", image: "Espresso"))
}
