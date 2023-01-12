//
//  Endpoint.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get } // HTTP Request Methods.
    var header: [String: String]? { get } // A dictionary that'll be filled with credentials if Server side asks for Authorization. Unnecessary for this App.
    var body: [String: String]? { get } // A dictionary that'll be filled with information if methods like POST, PATCH, and PUT is used. Unnecessary for this App because we don't make any data change on server side.
}

extension Endpoint {
    // If necessary, can be overrided. But for this app, it's not necessary.
    // An url is created by three parts. scheme + host + path.
    // Since our requests made to one API, scheme and host are same for all requests. Path will be different.
    var scheme: String {
        return "https" // Can be "http" or another custom scheme. But usually it is https
    }
    
    var host: String {
        return "itunes.apple.com"
    }
}
