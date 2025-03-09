//
//  NetworkAyah.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

struct NetworkAyah: Codable {
    let number: Int
    let text: String
    let numberInSurah: Int
    let juz: Int
    let manzil: Int
    let page: Int
    let ruku: Int
    let sajda: SajdaUnion
    let hizbQuarter: Int
}
