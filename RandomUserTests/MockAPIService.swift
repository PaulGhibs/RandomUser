//
//  MockAPIService.swift
//  RandomUserTests
//
//  Created by Paul Ghibeaux on 01/03/2022.
//

import Foundation
@testable import RandomUser
import XCTest


class MockAPIService: APIRequest {
    
    
    
    var loadDataIsCalled = false
    
    var completeClosure: ((Result<[UsersCollections], UserError>) -> Void)!
    var fakeUsersTab: [UsersCollections] = [UsersCollections]()
    var userError: ((UserError?)->())!
    var mockinfos: Result<UserInfos, UserError>?
    func getInfos(results: Int, page: Int, seed: String?, url: String, callback: @escaping (Result<UsersCollections, UserError>) -> Void) {
        var loadDataIsCalled = true

    }
    
    
    
}
