//
//  HTTPClient.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError>
    // Since it's async, it runs on a different thread and can return Result anytime.
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, RequestError> {
        
        // TODO: - URLComponents() instance can't be created. Fix that to make network calls generic.
        
        var urlComponents = URLComponents() // Building URL
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
//        guard let url = urlComponents.url else { return .failure(.invalidURL) }
        guard let url = URL(string: "https://itunes.apple.com/search?term=podcast") else { return .failure(.invalidURL)}
        
        // Building request
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header // Not gonna use in this app.
        
        
        if let body = endpoint.body { // Not gonna use in this app.
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil) // Because of await keyword, next line be executed only when URLSession.shared.data() function finished and returns the tuple.
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noResponse)
            }
            switch response.statusCode{
            case 200...299: // These cases normally considered as a success code.
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else { return .failure(.decode) }
                return .success(decodedResponse)
            case 401:
                return .failure(.unauthorized)
            default:
                return .failure(.unexpectedStatusCode)
            }
        } catch {
            return .failure(.unknown)
        }
    }
}
