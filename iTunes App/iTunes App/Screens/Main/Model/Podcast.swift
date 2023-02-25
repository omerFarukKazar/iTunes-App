//
//  Podcast.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 20.12.2022.
//

import Foundation

struct Podcast: Decodable { // model for results in PodcastResponse file
    let artistName: String?
    let trackName: String?
    let artworkLarge: URL?
    let releaseDate: String? // Verileri çekmede sorun olmadı çünkü completionHandler error vermedi ancak veriler nil geliyordu ancak veri tipini başta Date olarak verdiğim için Decode ederken oluşan sorundan dolayı nil geldi.
    let country: String?
    let genres: [String]?
    
    enum CodingKeys: String, CodingKey { // CodingKey ile server'den gelen key isimlere kendi uygulamamız içinde kullanmak istediğimiz isimi verebiliyoruz. Biz iTunes API kullandığımız için isimlendirme Server tarafında da camel case yapılmış ancak snake case, kebab case olsaydı, değişken isimlerini camel case'ye çevirmek daha uygun olurdu.
        case artistName
        case trackName
        case artworkLarge = "artworkUrl600"
        case releaseDate
        case country
        case genres
    }

    var beautifiedReleaseDate: String {
        guard let releaseDate = releaseDate else { return "-" }
        guard let index = (releaseDate.range(of: "T")?.lowerBound) else { return "-" }
        return String(releaseDate.prefix(upTo: index))
    }
}
