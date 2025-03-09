//
//  MetaResponse.swift
//  hw13network
//
//  Created by Nur-Magomed A on 09.03.2025.
//

struct NetworkMetaResponse: Codable {
    let code: Int
    let status: String
    let data: NetworkMetaData
}
