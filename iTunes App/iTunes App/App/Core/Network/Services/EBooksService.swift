//
//  BooksService.swift
//  iTunes App
//
//  Created by Ömer Faruk Kazar on 12.01.2023.
//

import Foundation

protocol EBooksServiceable {
    func getBooks() async -> Result<EBookResponse, RequestError>
}

struct EBookService: HTTPClient, EBooksServiceable {
    func getBooks() async -> Result<EBookResponse, RequestError> {
        return await sendRequest(endpoint: iTunesEndpoint.book , responseModel: EBookResponse.self)
    }
}
