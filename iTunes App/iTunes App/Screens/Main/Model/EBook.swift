//
//  EBook.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

struct EBook: Decodable {
    let artistName: String?
    let country: String?
    let releaseDate: String?
    let trackName: String?
    let previewURL: URL?
    let artworkUrl100: URL?
    let primaryGenreName: String?

    var beautifiedReleaseDate: String {
        guard let releaseDate = releaseDate else { return "-" }
        guard let index = (releaseDate.range(of: "T")?.lowerBound) else { return "-" }
        return String(releaseDate.prefix(upTo: index))
    }
}
