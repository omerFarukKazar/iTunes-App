//
//  PodcastResponse.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 20.12.2022.
//

import Foundation

struct PodcastResponse: Decodable { // This is the model corresponding to JSON object
    let resultCount: Int?
    let results: [Podcast]?
}
