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
    let releaseDate: Date?
    let trackName: String?
    let previewURL: String?
    let artworkUrl600: String?
    let genres: [String]?
}
