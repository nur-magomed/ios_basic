//
//  NetworkResponse.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

struct NetworkResponse: Codable {
    let code: Int
    let status: String
    let data: NetworkSurah
}
