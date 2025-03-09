//
//  NetworkSajda.swift
//  hw13network
//
//  Created by Nur-Magomed A on 09.03.2025.
//

struct SajdaClass: Codable {
    let id: Int
    let recommended, obligatory: Bool
}

enum SajdaUnion: Codable {
    case bool(Bool)
    case sajdaClass(SajdaClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Bool.self) {
            self = .bool(x)
            return
        }
        if let x = try? container.decode(SajdaClass.self) {
            self = .sajdaClass(x)
            return
        }
        throw DecodingError.typeMismatch(SajdaUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SajdaUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .bool(let x):
            try container.encode(x)
        case .sajdaClass(let x):
            try container.encode(x)
        }
    }
    
    public func isSajda() -> Bool {
        switch self {
        case .sajdaClass:
            return true
        default:
            return false
        }
    }
}


