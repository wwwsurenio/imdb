//
//  AuthenticatioPresenter.swift
//  imdb
//
//  Created by User01 on 12/7/23.
//

// AuthenticatioPresenter.swift

import Foundation

protocol AuthenticatioPresenterInput {
    func login(username: String, password: String)
    func register(username: String, password: String)
}

protocol AuthenticatioPresenterOutput: AnyObject {
    func showLoading()
    func hideLoading()
    func showErrorMessage(_ message: String)
    func showHomePage()
}

class AuthenticatioPresenter {
    weak var output: AuthenticatioPresenterOutput?
}

// MARK: - Authenticatio Presenter Input

extension AuthenticatioPresenter: AuthenticatioPresenterInput {
    
    func login(username: String, password: String) {
        // Implement the login logic here
        // Call the API to authenticate the user
        // Handle success and failure cases
        
    }
    
    func register(username: String, password: String) {
        // Implement the registration logic here
        // Call the API to register the user
        // Handle success and failure cases
        
    }
}
