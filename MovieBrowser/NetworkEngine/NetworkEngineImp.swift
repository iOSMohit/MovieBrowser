//
//  NetworkEngineImp.swift
//  MovieBrowser
//
//  Created by Mohit Kumar on 21/09/24.
//

import Foundation

final class NetworkEngineImp: NetworkEngine {
    private var session: URLSession
    private var decoder: JSONDecoder
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func makeGetRequest<T: Decodable>(endpoint: String, params: [String: String], headers: [String: String]) async throws -> T  {
        guard var urlComponents = URLComponents(string: Contants.BaseURL.baseURL+endpoint) else {
            throw ServiceError.badURL
        }
        
        let queryItems = params.getQueryItems()
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            throw ServiceError.badURL
        }
        
        var urLRequest = URLRequest(url: url)
        urLRequest.httpMethod = "GET"
        urLRequest.allHTTPHeaderFields = headers
        urLRequest.timeoutInterval = 10
        
        let (data, response) = try await session.data(for: urLRequest)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            let error = try decoder.decode(T.self, from: data)
            return error
        }
        let responseData = try decoder.decode(T.self, from: data)
        
        return responseData
    }
}
