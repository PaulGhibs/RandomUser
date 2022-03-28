//
//  SearchVMtests.swift
//  RandomUserTests
//
//  Created by Paul Ghibeaux on 28/03/2022.
//

import Foundation
import XCTest
@testable import RandomUser

class SearchVMTests: XCTestCase {
    
    var searchVM: SearchViewModel!
    var mockAPIService: MockAPIService!
    
    // ----------------------------------
    //  MARK: - Detail VMTests-
    //
    override func setUp() {
        super.setUp()
        mockAPIService = MockAPIService()
        
        searchVM = SearchViewModel(title: "", url: "https://randomuser.me/api/?page=1&results=1&seed=abc", apiService: mockAPIService)
    }
    
    override func tearDown() {
        searchVM = nil
        mockAPIService = nil
        super.tearDown()
    }
    
    func test_fetch_vm() {
        
        // When
        searchVM.loadData {_ in
            XCTAssertNotNil(self.searchVM.sections)
        }
        
        // then
        XCTAssertNotNil(mockAPIService?.loadDataIsCalled)
    }
    
    func test_fetch_vm_failed() {
        
        // Given
        let error = UserError.badURL
        
        // When
        
        mockAPIService?.fetchFail(error: (UserError.badURL))
        
        // Then
        XCTAssertFalse(false, error.localizedDescription)
        
    }
    
    
    
    
    
}
