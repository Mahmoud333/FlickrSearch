//
//  HistoryTests.swift
//  FlickerSearchTests
//
//  Created by Mahmoud Hamad on 16/04/2022.
//

import XCTest
@testable import FlickerSearch

class SearchHistoryTests: XCTestCase {
    
    var sut: SearchImageResultPresenter!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SearchImageResultPresenter(view: SearchImageResultViewController(), interactor: SearchImageResultInteractor(), router: SearchImageResultRouter())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        UserDefaultsValues.shared.recentSearches = nil
    }

    func testMaximumSize() throws {
        sut.saveSearchText(text: "1")
        sut.saveSearchText(text: "2")
        sut.saveSearchText(text: "3")
        sut.saveSearchText(text: "4")
        sut.saveSearchText(text: "5")
        sut.saveSearchText(text: "6")
        sut.saveSearchText(text: "7")
        sut.saveSearchText(text: "8")
        sut.saveSearchText(text: "9")
        sut.saveSearchText(text: "10")
        sut.saveSearchText(text: "11")
        XCTAssertEqual(10, UserDefaultsValues.shared.recentSearches?.count)
    }
    
    func testSaveOnlyRecent10() throws {
        sut.saveSearchText(text: "1")
        sut.saveSearchText(text: "2")
        sut.saveSearchText(text: "3")
        sut.saveSearchText(text: "4")
        sut.saveSearchText(text: "5")
        sut.saveSearchText(text: "6")
        sut.saveSearchText(text: "7")
        sut.saveSearchText(text: "8")
        sut.saveSearchText(text: "9")
        sut.saveSearchText(text: "10")
        sut.saveSearchText(text: "11")
        XCTAssertEqual(false, UserDefaultsValues.shared.recentSearches?.contains("1"))
    }
    
    func testSortByRecent() throws {
        sut.saveSearchText(text: "1")
        sut.saveSearchText(text: "2")
        sut.saveSearchText(text: "3")
        sut.saveSearchText(text: "1")
        
        XCTAssertEqual(0, UserDefaultsValues.shared.recentSearches?.firstIndex(of: "1"))
        XCTAssertEqual(1, UserDefaultsValues.shared.recentSearches?.firstIndex(of: "3"))
        XCTAssertEqual(2, UserDefaultsValues.shared.recentSearches?.firstIndex(of: "2"))
    }
    
    func testNoDuplicates() throws {
        sut.saveSearchText(text: "1")
        sut.saveSearchText(text: "1")
        
        XCTAssertEqual(1, UserDefaultsValues.shared.recentSearches?.count)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
