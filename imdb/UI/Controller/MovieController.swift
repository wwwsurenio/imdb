//
//  MovieController.swift
//  imdb
//
//  Created by User01 on 28/4/23.
//

import Foundation

protocol MovieControllerInput {
    func get()
    func parseJSON(_ movieData: Data) -> MovieModel?
}

class MovieController: NSObject {
    
}

// MARK: - MovieControllerInput
extension MovieController: MovieControllerInput {

    func get() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular") else { assertionFailure(); return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.url?.append(queryItems: [
            .init(name: "api_key", value: "b859aa49388105f4ed7ff53a89a40f66")
        ])
        let task = session.dataTask(with: request)
        task.resume()
    }
    
    func parseJSON(_ movieData: Data) -> MovieModel? {
        
        return nil
    }
    
}

extension MovieController: URLSessionDataDelegate {
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let decodedData = String(decoding: data, as: UTF8.self)
        debugPrint(decodedData)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        debugPrint(error)
    }
}
