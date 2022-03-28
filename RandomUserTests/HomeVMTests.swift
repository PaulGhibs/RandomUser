//
//  HomeVMTests.swift
//  RandomUserTests
//
//  Created by Paul Ghibeaux on 28/03/2022.
//

import Foundation
import XCTest
@testable import RandomUser


class HomeVMTests: XCTestCase {
    
    var homeVM: HomeViewModel!
    var mockAPIService: MockAPIService!
    
    
    // ----------------------------------
    //  MARK: - World VMTests -
    //
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        homeVM = HomeViewModel(apiService: mockAPIService)
    }
    
    override func tearDown() {
        homeVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_collection() {
        // Given
        mockAPIService.fakeUsersTab = [UsersCollections]()
        let choosenCountry = "world"
        
        // When
        homeVM.loadData {_ in
            XCTAssertNotNil(self.homeVM.sections)
            XCTAssertNotNil(choosenCountry)
        }
        
        // then
        XCTAssert(mockAPIService!.loadDataIsCalled)
        XCTAssertNotNil(choosenCountry)
    }
    
    func test_loading_when_fetching() {
        
        //Given
        var loadingStatus = false
        let expect = XCTestExpectation(description: "Loading status updated")
        
        homeVM.updateLoadingStatus = { [weak homeVM] in
            loadingStatus = homeVM!.isLoading
            expect.fulfill()
        }
        
        //when fetching
        homeVM.loadData { result in
            
            XCTAssertTrue(loadingStatus)
        }
        
        
        // then finished fetching
        XCTAssertTrue( loadingStatus )
        
        wait(for: [expect], timeout: 1.0)
    }
    
    func test_fetch_recipe_failed() {
        
        // Given a failed fetch with a certain failure
        let error = UserError.noInfoFound

        // When
        self.homeVM.loadData {  _ in
            
            XCTAssertNotNil(self.homeVM.sections)
        }
        
        mockAPIService.fetchFail(error: (UserError.noInfoFound))

        // then
        XCTAssertFalse(false, error.localizedDescription)
        
        
    }
//    
    

  
    
    
    func test_reload_data() {
        // given
        let user: UsersCollections = mockAPIService.fakeUsersTab.first ?? UsersCollections.init(results: [], info: Info.init(seed: "", results: 10, page: 1, version: ""))
        let covidSection = HomeSection.init(userCollection: user)
        let mockinfos: () = mockAPIService.mockinfos = .failure(UserError.badURL)
        // when
        self.homeVM.loadData { error in
            _ = covidSection.cellsVM
            _ = mockinfos
            // then
            XCTAssertEqual(self.homeVM.sections.count, 1)
            XCTAssertEqual(self.homeVM.sections.count, 1)
        }
        
        
        
    }
    
    
    
}
