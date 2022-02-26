//
//  HomeViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import Foundation

class HomeViewModel: ViewModel  {
    
    var titleTabBar: String = "Home"
    var shouldDisplayBackButton = false
    var horizontalGrid = [HorizontalGrid]()
    var sections: [Section] = []
    var url = "https://randomuser.me/api/?results=20"
    
    var apiService: APIRequest
    
    init(apiService: APIRequest) {
        self.apiService = apiService
    }
    
    
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        self.horizontalGrid(name: "Example of people", url: self.url) {error in
            guard error == nil else {
                callback(error)
                return
            }
            self.sections = [HomeSection(horizontalGrids: self.horizontalGrid)]
            self.horizontalGrid = []
            callback(nil)
        }
    }
    
    
    // carrousel in table view like collection view
    
    
    func horizontalGrid(name: String, url: String, callback: @escaping(EmptyError?) -> ()) {
        apiService.getInfos(url: url) { result in
            switch result {
                case .failure(let error):
                    callback(error)
                case .success(let users):
                    var listUsers = [UserInfos]()
                    
                    for user in users.results {
                        let name = user.name
                        let picture = user.picture
                        let city = user.location
                        let phone = user.phone
                        let gender = user.gender
                        let email = user.email
                        let login = user.login
                        let dob = user.dob
                        let registered = user.registered
                        let nat = user.nat
                        let id = user.id
                        let cell = user.cell
                        
                        let userPage = UserInfos(gender: gender, name: name, location: city, email: email, login: login, dob: dob, registered: registered, phone: phone, cell: cell, id: id, picture: picture, nat: nat)
                        
                        listUsers.append(userPage)
                        print(listUsers)
                    }
                    
                    self.horizontalGrid.append(HorizontalGrid(title: name, seeAll: url, userPage: listUsers))
                    callback(nil)
            }
        }
    }
    
}
