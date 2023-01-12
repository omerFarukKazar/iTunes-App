//
//  MusicsService.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

protocol MusicsServiceable {
    func getMusics() async -> Result<MusicResponse, RequestError>
}

struct MusicsService: HTTPClient, MusicsServiceable {
    func getMusics() async -> Result<MusicResponse, RequestError> {
        return await sendRequest(endpoint: iTunesEndpoint.music, responseModel: MusicResponse.self)
    }
}
