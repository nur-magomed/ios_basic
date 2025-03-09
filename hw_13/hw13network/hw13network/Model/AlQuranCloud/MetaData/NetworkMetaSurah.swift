//
//  NetworkMetaSurahs.swift
//  hw13network
//
//  Created by Nur-Magomed A on 09.03.2025.
//

struct NetworkMetaSurah: Codable {
    let count: Int
    let references: [SurahsReference]
}


struct SurahsReference: Codable {
    let number: Int
    let name: String
    let englishName: String
    let englishNameTranslation: String
    let numberOfAyahs: Int
    let revelationType: NetworkRevelationType
}

enum NetworkRevelationType: String, Codable {
    case meccan = "Meccan"
    case medinan = "Medinan"
}
