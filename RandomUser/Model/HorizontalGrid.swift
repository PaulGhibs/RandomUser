//
//  HorizontalGrid.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation

struct HorizontalGrid {
    var title : String
    var seeAll: String
    var userPage : [UserInfos]
    
    init(title:String, seeAll:String, userPage: [UserInfos]){
        self.title = title
        self.seeAll = seeAll
        self.userPage = userPage
    }
    
}
