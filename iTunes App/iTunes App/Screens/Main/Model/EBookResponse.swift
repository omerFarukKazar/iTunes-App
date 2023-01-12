//
//  BookResponse.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

struct EBookResponse: Decodable {
    let resultCount: Int?
    let results: [EBook]?
}
