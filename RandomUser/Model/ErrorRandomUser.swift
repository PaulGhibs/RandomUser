//
//  ErrorRandomUser.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation
// MARK: - enum to manage error
enum UserError: Error {
    // two possibilities
    case  badURL
    case  noInfoFound(Data?, URLResponse?)
    // raised a message for each error as string
    
    func errorMessages() throws -> String {
        switch self {
            case .badURL:
                return NSLocalizedString("badurl", comment: "Oups ! je n'ai rien trouvé a cette adresse")
            case .noInfoFound:
                return NSLocalizedString("failTofecthinfos", comment: "Impossible de charger les infos!")
                
        }
    }
}
