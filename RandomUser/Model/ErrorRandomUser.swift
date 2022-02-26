//
//  ErrorRandomUser.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation
// MARK: - enum to manage error
enum UserError: EmptyError {

    
    // three possibilities
    case  badURL
    case  noInfoFound
    case  noNetwork
    // raised a message for each error as string
    
    var errorAction: ErrorAction {
        switch self {
            case .badURL: return .returnBack
            case .noInfoFound: return .navigation
            case .noNetwork: return .refresh
        }
    }
    
    
    var errorTitle: String? {
        switch self {
            case .badURL:
                return "No Results"
            case .noInfoFound:
                return "Nothing found here"
            case .noNetwork:
                return "No internet"
        }
    }
    
    var errorDescription: String? {
        switch self {
            case .badURL:
                return "Sorry we found no result with this search "
            case .noInfoFound:
                return " You can found people from home or search page "
            case .noNetwork:
                return "You have no internet, please try again"
        }
    }
    
    var imageName: String? {
        switch self {
            case .badURL:
                return "noResult"
            case .noInfoFound:
                return "no infos"
            case .noNetwork:
                return "noInternet"
        }
    }
    
    var buttonTitle : String? {
        switch self {
            case .badURL:
                return "Return home"
            case .noInfoFound:
                return "Go to home"
            case .noNetwork:
                return "Refresh"
        }
    }
}
