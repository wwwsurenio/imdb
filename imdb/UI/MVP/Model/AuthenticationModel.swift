//
//  AuthenticationModel.swift
//  imdb
//
//  Created by User01 on 28/7/23.
//

import Foundation

protocol AuthenticationModelInput: AnyObject {
    func createRequestToken()
    func createSessionID(requestToken: String)
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
        let api = AuthAPI.createRequestToken
        
        let session = URLSession.shared
        let dataTask = session.dataTask(withAPI: api) { [weak self] (data, response, error) in
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
        
        dataTask.resume()
    }
    
    func createSessionID(requestToken: String) {
        
    }
}
