//
//  CoffeeDecode.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 13.12.2023.
//

import Foundation

// coffee.JS Decode
extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil)
            else {
                fatalError("Couldn't find \(file) in main bundle.")
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            fatalError("Couldn't decode \(file) from main bundle:\n\(error)")
        }
    }
}
