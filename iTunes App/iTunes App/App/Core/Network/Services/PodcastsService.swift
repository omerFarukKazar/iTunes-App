//
//  PodcastsService.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

protocol PodcastsServiceable {
    func getPodcasts() async -> Result<PodcastResponse, RequestError>
}

struct PodcastsService: HTTPClient, PodcastsServiceable {
    func getPodcasts() async -> Result<PodcastResponse, RequestError> {
        return await sendRequest(endpoint: iTunesEndpoint.podcast, responseModel: PodcastResponse.self)
    }
}
