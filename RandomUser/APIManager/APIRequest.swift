//
//  RequestAPI.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation


protocol APIRequest {
    func getInfos(url: String, callback: @escaping(Result<UsersCollections, UserError>) -> Void)
}
