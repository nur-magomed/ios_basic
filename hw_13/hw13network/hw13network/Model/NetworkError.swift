//
//  NetworkError.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//

import Foundation

enum NetworkError: Error {
    case networkError
    case wrongType
    case invalidStatus
    case client
    case server
    case noData
    case parsingError
}
