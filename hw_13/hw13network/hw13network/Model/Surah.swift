//
//  Surah.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

struct Surah: Codable {
    let number: Int
    let name: String
    let englishName: String
    let englishNameTranslation: String
    let revelationType: RevelationType
    let numberOfAyahs: Int
    let ayahs: [Ayah]
}
