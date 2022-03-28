//
//  StoobData.swift
//  RandomUserTests
//
//  Created by Paul Ghibeaux on 28/03/2022.
//

import Foundation
import XCTest
@testable import RandomUser

class stoobData {
    // status code 200
    let responseOK = HTTPURLResponse(url: URL(string: "www.google.fr")!,statusCode: 200, httpVersion: nil, headerFields: nil)!
    // status code 500
    let responseKO = HTTPURLResponse(url: URL(string: "www.google.fr")!,statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    // good data
    var correctData : Data {
        let bundle = Bundle(for: stoobData.self)
        let url = bundle.url(forResource: "UserList", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }
    
//    // wrong data
//    var incorrectData : Data {
//        let bundle = Bundle(for: stoobData.self)
//        let url = bundle.url(forResource: "GoogleTranslate", withExtension: "json")
//        let data = try! Data(contentsOf: url!)
//        return data
//    }
    
    // fake instance
    var userPage = UserInfos(gender: Gender.male, name: Name.init(title:"", first: "", last: ""), location: Location.init(street: Street.init(number: 0, name: ""), city: "", state: "", country: "", postcode: Postcode.string(""), coordinates: Coordinates.init(latitude: "", longitude: ""), timezone: Timezone.init(offset: "", timezoneDescription: "")), email: "", login: Login.init(uuid: "", username: "", password: "", salt: "", md5: "", sha1: "", sha256: ""), dob: Dob.init(date: "", age: 26), registered: Dob.init(date: "", age: 26), phone: "", cell: "", id: ID.init(name: "", value: ""), picture: Picture.init(large: "https://randomuser.me/api/portraits/men/64.jpg", medium: "", thumbnail: ""), nat: "" )
    
   
}
