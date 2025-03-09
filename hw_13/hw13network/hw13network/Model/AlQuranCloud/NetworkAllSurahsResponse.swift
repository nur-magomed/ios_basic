//
//  NetworkResponse.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

struct NetworkAllSurahsResponse: Codable {
    let code: Int
    let status: String
    let data: NetworkListOfSurah
}
