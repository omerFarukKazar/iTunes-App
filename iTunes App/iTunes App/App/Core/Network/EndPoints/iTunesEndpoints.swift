//
//  PodcastsEndpoint.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

enum iTunesEndpoint {
    case podcast
    case book
    case music
}

extension iTunesEndpoint: Endpoint {
    var path: String {
        switch self {
        case .podcast:
            return "/search"
        case .book:
            return "/search"
        case .music:
            return "/search"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .podcast:
            let queryItem = URLQueryItem(name: "term", value: "podcast")
            return [queryItem]
        case .book:
            let queryItem = URLQueryItem(name: "term", value: "book")
            return [queryItem]
        case .music:
            let queryItem = URLQueryItem(name: "term", value: "music")
            return [queryItem]
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .podcast, .book, .music:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .podcast, .book, .music:
            return nil
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .podcast, .book, .music:
            return nil
        }
    }
}
