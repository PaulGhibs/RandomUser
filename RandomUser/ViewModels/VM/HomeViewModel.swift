//
//  HomeViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 22/02/2022.
//

import Foundation

class HomeViewModel: ViewModel  {
  
    var titleTabBar = NSLocalizedString("Home", comment: "")

    var shouldDisplayBackButton = false
    var sections: [Section] = []
    var url = "https://randomuser.me/api/?results=30"
    
    var apiService: APIRequest
    
    init(apiService: APIRequest) {
        self.apiService = apiService
    }
    var updateLoadingStatus: (()->())?

    // is requesting
    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        self.isLoading = true
        // api service protocol with typed ingredients
        _ = apiService.getInfos(url: self.url) { result in
            switch result {
                case .failure(let error):
                    callback(error)
                case .success(let users):
                    var tempSections: [Section] = []
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
                  
                    let currentCollectionSection = HomeSection(userCollection: users)
                        
                    tempSections.append(currentCollectionSection)
                    
                    
                    self.sections = tempSections
                    callback(nil)
                    
            }
            
           
        }
    
    
    }
    
}
