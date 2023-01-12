//
//  RequestError.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode Error"
        case .invalidURL:
            return "Invalid URL"
        case .noResponse:
            return "No Response From Server"
        case .unauthorized:
            return "Session Expired"
        case .unexpectedStatusCode:
            return "Unknown Status Code"
        default:
            return "Unkown Error"
        }
    }
}
