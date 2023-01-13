//
//  MusicResponse.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

struct MusicResponse: Decodable {
    let resultCount: Int?
    let results: [Music]?
}
