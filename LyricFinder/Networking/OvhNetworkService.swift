//
//  OvhNetworkService.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import Foundation

final class OvhNetworkService: NetworkProtocol {
    
    func fetchLyrics(artistName: String, songTitle: String, completionHandler: @escaping (Result<Lyrics, NetworkServiceError>) -> Void) {
        
        if artistName.isEmpty || songTitle.isEmpty {
            completionHandler(.failure(.invalidRequest("Please provide the artist name and song title")))
            return
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        let endpoint = Constants.shared.baseURL + "\(artistName)/" + "\(songTitle)"
        
        let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        guard let endpointURL = URL(string: safeURLString!) else {
            completionHandler(.failure(.invalidURL(safeURLString!)))
            return
        }
        
        let dataTask = session.dataTask(with: endpointURL) { (data, response, error) in
            guard error == nil else {
                completionHandler(.failure(NetworkServiceError.forwarded(error!)))
                return
            }
            
            guard let jsonData = data else {
                completionHandler(.failure(.invalidPayload(endpointURL)))
                return
            }
            self.decode(jsonData: jsonData,completionHandler: completionHandler)
        }
        
        dataTask.resume()
    }
    
    private func decode(jsonData: Data, completionHandler: @escaping (Result<Lyrics,NetworkServiceError>) -> Void) {
        let decodeder = JSONDecoder()
        do {
            let lyrics = try decodeder.decode(Lyrics.self, from: jsonData)
            completionHandler(.success(lyrics))
        } catch let error {
            completionHandler(.failure(.forwarded(error)))
        }
    }
    
    
}
