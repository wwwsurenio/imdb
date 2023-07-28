//
//  AuthenticationModel.swift
//  imdb
//
//  Created by User01 on 28/7/23.
//

import Foundation

protocol AuthenticationModelInput: AnyObject {
    
}

protocol AuthenticationModelOutput: AnyObject {
    
}

class AuthenticationModel {
    
    weak var output: AuthenticationModelOutput?
    
}

extension AuthenticationModel: AuthenticationModelInput {
    
}
