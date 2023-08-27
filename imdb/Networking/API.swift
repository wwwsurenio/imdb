//  Networking >
//  API.swift
//  imdb
//
//  Created by User01 on 5/6/23.
//

import Foundation

protocol GenericAPI {
    var urlRequest: URLRequest { get }
}

enum API {
    static let apiURL = "https://api.themoviedb.org/3/"
    fileprivate static let apiKey = "b859aa49388105f4ed7ff53a89a40f66"
    
    static let imageURL = URL(string: "https://image.tmdb.org/t/p/w500")!
    
    static let authenticationHeaders = [
        "accept": "application/json",
        "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiODU5YWE0OTM4ODEwNWY0ZWQ3ZmY1M2E4OWE0MGY2NiIsInN1YiI6IjY0NjIwMzYxZGJiYjQyMDEzNjM3YmZlMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.51k-GA8tLOOAboK01qiYEJA8tRIbNBtrtKufs7JXpZU"
    ]
}

enum MoviesAPI: GenericAPI {
    static let apiURL = API.apiURL + "movie/"
    
    case popularList
    case details(movieID: Int)
    
    fileprivate var method: String {
        switch self {
        case .popularList, .details:
            return "GET"
        }
    }
    
    fileprivate  var pathURL: String {
        switch self {
        case .popularList:
            return Self.apiURL + "popular"
        case let .details(movieID):
            return Self.apiURL + "\(movieID)"
        }
    }
    
    fileprivate var parameters: [String: Any] {
        var params = [String: Any]()
        switch self {
        case .popularList:
            break
        case .details:
             break
        }
        params["api_key"] = API.apiKey
        return params
    }
    
    var urlRequest: URLRequest {
        guard let url = URL(string: pathURL) else { fatalError() }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        switch method {
        case "GET":
            request.url?.append(queryItems: parameters.compactMap { key, value -> URLQueryItem? in
                guard let valueString = value as? String else {
                    print("Error while converting query parametr to string")
                    return nil
                }
                return URLQueryItem(name: key, value: valueString)
            })
        default:
            break
        }
        return request
    }
}

enum AuthAPI: GenericAPI {
    static let apiURL = API.apiURL + "authentication/"
    
    case createRequestToken
    
    fileprivate var method: String {
        return "GET"
    }
    
    fileprivate var pathURL: String {
        switch self {
        case .createRequestToken:
            return Self.apiURL + "token/new"
        }
    }
    
    fileprivate var parameters: [String: Any] {
        var params = [String: Any]()
        params["api_key"] = API.apiKey
        return params
    }
    
    var urlRequest: URLRequest {
        guard let url = URL(string: pathURL) else { fatalError() }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        switch method {
        case "GET":
            request.allHTTPHeaderFields = API.authenticationHeaders
            request.url?.append(queryItems: parameters.compactMap { key, value -> URLQueryItem? in
                guard let valueString = value as? String else {
                    print("Error while converting query parameter to string")
                    return nil
                }
                return URLQueryItem(name: key, value: valueString)
            })
        default:
            break
        }
        return request
    }
}

extension URLSession {
    func dataTask(withAPI api: GenericAPI, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return dataTask(with: api.urlRequest, completionHandler: completionHandler)
    }
}

func completionHandler(data: Data?, response: URLResponse?, error: Error?) -> Void {
    
}
