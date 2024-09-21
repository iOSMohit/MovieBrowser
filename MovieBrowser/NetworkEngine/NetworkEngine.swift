//
//  NetworkEngine.swift
//  MovieBrowser
//
//  Created by Mohit Kumar on 21/09/24.
//

import Foundation

protocol NetworkEngine {
    init(session: URLSession, decoder: JSONDecoder)
    func makeGetRequest<T: Decodable>(endpoint: String, params: [String: String], headers: [String: String]) async throws -> T
}
