//
//  UserPageViewModel.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 27/02/2022.
//

import Foundation


class UserPageViewModel: ViewModel {
    var sections: [Section] = []
    
   
    
    var shouldDisplayBackButton: Bool = true
    
    var titleTabBar: String = ""
    var userInfos: UserInfos
    
    
    init(userInfos: UserInfos) {
        self.userInfos = userInfos
    }
    func loadData(callback: @escaping (EmptyError?) -> ()) {

        self.sections = [UserSection(user: userInfos)]
        callback(nil)
    }
}
