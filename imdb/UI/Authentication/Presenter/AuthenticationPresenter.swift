//
//  AuthenticationPresenter.swift
//  imdb
//
//  Created by User01 on 12/7/23.
//

// AuthenticationPresenter.swift

import Foundation

protocol AuthenticationPresenterInput: AnyObject {
    func login(username: String, password: String)
    func register(username: String, password: String)
    func createRequestToken()
}

protocol AuthenticationPresenterOutput: AnyObject {
    func showLoading()
    func hideLoading()
    func showErrorMessage(_ message: String)
    func showProfileScreen()
    func openAuthURL(url: URL)
    func dismissWebView()
}

class AuthenticationPresenter {
    var authenticationModel: AuthenticationModelInput
    weak var output: AuthenticationPresenterOutput?
    
    init(authenticationModel: AuthenticationModelInput, output: AuthenticationPresenterOutput? = nil) {
        self.authenticationModel = authenticationModel
        self.output = output
    }
}

// MARK: - Authenticatio Presenter Input

extension AuthenticationPresenter: AuthenticationPresenterInput {
    
    func createRequestToken() {
        authenticationModel.createRequestToken()
    }
    
    
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

extension AuthenticationPresenter: AuthenticationModelOutput {
    func didCreateSessionSuccess(withToken token: String) {
        DispatchQueue.main.async {
            let authURLString = "https://www.themoviedb.org/authenticate/\(token)"
            guard let authURL = URL(string: authURLString) else {
                return
            }
            self.output?.openAuthURL(url: authURL)
        }
    }
    
    func didCreateSessionFail(withError error: Error) {
        
    }
    
    
}
