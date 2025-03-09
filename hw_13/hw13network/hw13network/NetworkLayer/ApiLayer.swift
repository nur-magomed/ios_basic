//
//  ApiLayer.swift
//  hw13network
//
//  Created by Nur-Magomed A on 02.03.2025.
//
import Foundation

typealias ApiCallback = (Result<Data, NetworkError>) -> Void

struct ApiLayer {

    private let urlSession = URLSession.shared

    func makeRequest(_ request: URLRequest, callback: @escaping ApiCallback) -> Void {
        urlSession.dataTask(with: request) { data, response, error in
            guard error == nil else {
                callback(.failure(.networkError))
                return
            }

            if let validationResponse = validate(response) {
                callback(.failure(validationResponse))
                return
            }

            guard let data else {
                callback(.failure(.noData))
                return
            }

            callback(.success(data))

        }.resume()
    }

    private func validate(_ response: URLResponse?) -> NetworkError? {
        guard let httpResponse = response as? HTTPURLResponse else {
            return .wrongType
        }

        switch httpResponse.statusCode {
        case 100..<200, 300..<400:
            return .invalidStatus
        case 400..<500:
            return .client
        case 500..<600:
            return .server
        default:
            break
        }
        return nil
    }
}
