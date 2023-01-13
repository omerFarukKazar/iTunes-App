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
    let previewURL: URL?
    let artworkUrl100: URL?
    let releaseDate: String?
    let country: String?
    let primaryGenreName: String?
    
}
