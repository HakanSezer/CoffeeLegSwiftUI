//
//  CoffeeModel.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 13.12.2023.
//

import Foundation

struct CoffeLegModel : Decodable, Identifiable {
  let id: String
  let name: String
  let sertlik: String
  let aciklama: String
  let image: String
}
