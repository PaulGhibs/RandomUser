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
    var userError: ((UserError)->())!
    var mockinfos: Result<UserInfos, UserError>?
    
    var correctData : Data {
        let bundle = Bundle(for: stoobData.self)
        let url = bundle.url(forResource: "UserList", withExtension: "json")
        guard let data = try? Data(contentsOf: (url ?? URL(string: "https://randomuser.me/api/?page=3&results=10&seed=abc")!)) else { return self.correctData }
        return data
    }
    
    
    func getInfos(url: String, callback: @escaping (Result<UsersCollections, UserError>) -> Void) {
        if url == "badURL" {
            loadDataIsCalled = false
            callback(.failure(.noInfoFound))
        } else {
            loadDataIsCalled = true

            guard let listUser = try? JSONDecoder().decode(UsersCollections.self, from: correctData) else { return  }
            callback(.success(listUser))
        }
 
    }
    // Fetch Failed
    func fetchFail(error: UserError?) {
        guard error != nil else {
            return}
        switch error {
            case.noInfoFound : print(error?.errorDescription as Any)
            case.badURL : print(error?.errorAction as Any)
            case.noNetwork : print(error?.errorName as Any)


            case .none:
            break
        }
        
        print(error?.errorTitle as Any)
        print(error?.buttonTitle as Any)
        print(error?.imageName as Any)

        
    }

}

