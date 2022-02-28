//
//  UserPageRouting.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 27/02/2022.
//

import Foundation
// detail routing entry
class UserDetailRouting: RoutingEntry {
    
    var user : UserInfos
    
    
    init(user: UserInfos){
        self.user = user
    }
    
    var viewController: Controller? {
        
        let viewModel = UserPageViewModel(userInfos: user)
        
        return BaseCollectionViewController(viewModel: viewModel, compositionalLayout: UserCompositional())
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
    
}
