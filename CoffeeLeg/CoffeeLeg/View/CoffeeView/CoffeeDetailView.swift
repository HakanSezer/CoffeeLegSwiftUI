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
                // ArkaPlan Rengi
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
                                .frame(width: 160,height: 160)
                                
                        }.offset(y: -140)
                      
                            VStack {
                                Text(coffee.name)
                                    .font(.title)
                                Text(coffee.sertlik)
                                    .foregroundColor(.secondary)
                            }
                            .offset(y: -140)
                        }
                   
                    ScrollView(.vertical, showsIndicators: false) {
                        Text(coffee.aciklama)
                            .padding()
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.95, height: UIScreen.main.bounds.height * 0.37)
                    .offset(y: -150)
                }
            }
        }
    }
}

#Preview {
    CoffeeDetailView(coffee: CoffeLegModel(id:"Espresso" , name:"Espresso" , sertlik: "Orta", aciklama:  "Espresso, yoğun ve konsantre bir kahve türüdür. İtalyanca kökenli bir terim olan espresso, hızlı veya hemen anlamına gelir. Bu kahve türü, basınçlı su kullanılarak öğütülmüş kahve çekirdeklerinden elde edilir.\r \rİşte bir espresso yapımının genel adımları:\r \rÇekirdek Seçimi ve Öğütme:\r  \rKaliteli bir espresso yapmak için taze kahve çekirdekleri seçilmeli ve kullanılmadan hemen önce öğütülmelidir. Genellikle ince öğütülmüş kahve kullanılır.\r \rDozaj: Standart bir espresso shot için genellikle yaklaşık 7 ila 9 gram kahve kullanılır.\r \rPresleme (Tamping): Öğütülmüş kahve, espresso makinesinin portafilter'ına konulur ve özel bir alet kullanılarak sıkıştırılır (preslenir). Bu adım, kahvenin suyun baskısı altında homojen bir şekilde çıkmasını sağlar.\r \rEspresso Makinesi Kullanımı:\r  \rPortafilter, espresso makinesine yerleştirilir ve su yüksek basınç altında çekirdeklerden geçirilir. Bu, kısa sürede yoğun, aromatik bir kahve elde etmenizi sağlar.\r \rExtraction (Çekilme):\r \rEspresso, genellikle 25 ila 30 saniye arasında bir süre içinde çekilir. Bu süre, çekirdek türüne, öğütme derecesine ve kullanılan makineye bağlı olarak değişebilir.\r \rSonuç olarak, espresso küçük bir hacimde, yoğun bir lezzet profiline sahip olan ve genellikle tek bir yudumda içilen bir kahve türüdür. Ayrıca, birçok kahve içkisinin temelini oluşturan bir bileşen olarak da kullanılır, örneğin cappuccino, latte gibi kahve içeceklerinin temelini oluşturur.", image: "Espresso"))
}
