//
//  NetworkService.swift
//  DocTest
//
//  Created by Nikita Tsomuk on 16.03.2024.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    private init()  {}
    
    private func createURL() -> URL? {
        let urlString = "https://raw.githubusercontent.com/salfa-ru/test_iOS_akatosphere/main/test.json"
        let url = URL(string: urlString)
        return url
    }

    func fetchData() async throws -> Doctor {
        guard let url = createURL() else { throw NetworkingError.badURL }
        let response = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let result = try decoder.decode(Doctor.self, from: response.0)
        return result
    }
}

enum NetworkingError: Error {
    case badURL, badRequest, badResponce, invalidData
}
