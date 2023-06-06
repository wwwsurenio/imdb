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

extension URLSession {
    func dataTask(withAPI api: GenericAPI, completionHandler: @escaping @Sendable (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return dataTask(with: api.urlRequest, completionHandler: completionHandler)
    }
}
