//
//  NetworkController.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import Foundation

public protocol NetworkProtocol {
    func fetchLyrics(artistName: String, songTitle: String, completionHandler: @escaping (Result<Lyrics,NetworkServiceError>)->Void)
}

public struct Lyrics: Codable {
    var lyrics: String
}

public struct Song: Codable {
    var lyrics: String
    var artist: String
    var name: String
}

public enum NetworkServiceError: Error {
    case invalidRequest(String)
    case invalidURL(String)
    case forwarded(Error)
    case invalidPayload(URL)
}
