//
//  iTunesAPI.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 20.12.2022.
//

import UIKit

enum iTunesAPIQuery {
    case podcast
}

final class iTunesAPI {
    static let shared = iTunesAPI() // Singleton
    private let baseURL: URL = URL(string: "https://itunes.apple.com/search")! // We'll append query items to this url.
    
    // MARK: - GET
    /// Sends a request to get podcast data from iTunes API.
    /// Uses a closure as completion to handle the success and error situations on where the function called.
    func fetchPodcasts(completion: @escaping (PodcastResponse?, Error?) -> Void) {
        // By using completion defined the error and success behaviours.
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let url = baseURL.appending(queryItems: [URLQueryItem(name: "term", value: "podcast")]) //Method adds the "?" and "=" signs itself.
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let data = data else { return }
            let podcastResponse = try? JSONDecoder().decode(PodcastResponse.self, from: data)
            completion(podcastResponse, nil)
        }
        dataTask.resume()
    }
}
