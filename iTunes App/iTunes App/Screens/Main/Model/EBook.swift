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
}
