//
//  Music.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

struct Music: Decodable {
    let artistName: String?
    let trackName: String?
    let previewURL: String?
    let artworkUrl100: String?
    let releaseDate: Date?
    let genres: [String]?
    
}
