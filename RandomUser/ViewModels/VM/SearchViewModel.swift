//
//  SearchViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 28/02/2022.
//


import Foundation

// searchByUrl page
class SearchViewModel: ViewModel {
    var shouldDisplayBackButton: Bool = true
    
    var titleTabBar: String
    
    var title: String?
    var sections: [Section] = []
    var nextPage : Int?
    var canLoadMore: Bool {
        return nextPage != nil
    }
    var isFetchInProgress: Bool = false
    var url: String
    let apiService : APIRequest
    
    // title reprensent the text in the navBar
    // apiService : AnimeRequest in app, MockService in Tests
    init(title: String, url: String, apiService: APIRequest){
        self.title = title
        self.url = url
        self.apiService = apiService
        self.titleTabBar = NSLocalizedString("Country results📍 ", comment: "")

    }
    
    // loadData is called in the controller
    func loadData(callback: @escaping (EmptyError?) -> ()) {
        apiService.getInfos(url: self.url) { result in
            
            switch result {
                case .failure(let error) :
                    callback(error)
                case .success(let users) :
                    self.nextPage = users.info.page
                    
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
