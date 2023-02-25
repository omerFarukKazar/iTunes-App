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

    var beautifiedReleaseDate: String {
        guard let releaseDate = releaseDate else { return "-" }
        guard let index = (releaseDate.range(of: "T")?.lowerBound) else { return "-" }
        return String(releaseDate.prefix(upTo: index))
    }
    
}
