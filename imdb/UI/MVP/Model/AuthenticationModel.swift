//
//  AuthenticationModel.swift
//  imdb
//
//  Created by User01 on 28/7/23.
//

import Foundation

protocol AuthenticationModelInput: AnyObject {
    func createRequestToken()
}

protocol AuthenticationModelOutput: AnyObject {
    func didCreateSessionSuccess(withToken token: String)
    func didCreateSessionFail(withError error: Error)
}

class AuthenticationModel {
    weak var output: AuthenticationModelOutput?
}

extension AuthenticationModel: AuthenticationModelInput {
    func createRequestToken() {
        let urlString = "https://api.themoviedb.org/3/authentication/token/new"
        guard let url = URL(string: urlString) else {
            // Handle invalid URL error
            return
        }
        
        let headers = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODU5YWE0OTM4ODEwNWY0ZWQ3ZmY1M2E4OWE0MGY2NiIsInN1YiI6IjY0NjIwMzYxZGJiYjQyMDEzNjM3YmZlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.51k-GA8tLOOAboK01qiYEJA8tRIbNBtrtKufs7JXpZU"
        ]

        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { [weak self] (data, response, error) in
            if let error = error {
                self?.output?.didCreateSessionFail(withError: error)
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
                // Parse the response data to get the token (assuming it's in JSON format)
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let token = jsonObject["request_token"] as? String {
                    self?.output?.didCreateSessionSuccess(withToken: token)
                } else {
                    // Handle parsing error
                    self?.output?.didCreateSessionFail(withError: NSError(domain: "ParsingError", code: 0, userInfo: nil))
                }
            } else {
                // Handle invalid response or status code error
                self?.output?.didCreateSessionFail(withError: NSError(domain: "UnknownError", code: 0, userInfo: nil))
            }
        }
        print("request made")

        dataTask.resume()
    }
}
