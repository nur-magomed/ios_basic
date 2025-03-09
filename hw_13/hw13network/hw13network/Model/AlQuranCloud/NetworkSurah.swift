//
//  NetworkSurah.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

struct NetworkSurah: Codable {
    let number: Int
    let name: String
    let englishName: String
    let englishNameTranslation: String
    let revelationType: String
    let ayahs: [NetworkAyah]
}
