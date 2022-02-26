//
//  EmptyError.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 25/02/2022.
//

import Foundation

enum ErrorAction {
    case refresh
    case returnBack
    case navigation
    
}

protocol EmptyError: LocalizedError {
    var errorTitle : String? { get }
    var imageName: String? { get }
    var buttonTitle: String? { get }
    var errorAction: ErrorAction { get }
}

extension EmptyError{
    var errorTitle: String? {
        return nil
    }
    var errorName: String? {
        return nil
    }
    
    var buttonTitle: String? {
        return nil
        
    }
}

