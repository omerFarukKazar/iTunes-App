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
            return "?term=podcast"
        case .book:
            return "?term=book"
        case .music:
            return "?term=music"
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
