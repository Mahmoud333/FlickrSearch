//
//  SearchImageUITests.swift
//  FlickerSearchUITests
//
//  Created by Mahmoud Hamad on 17/04/2022.
//

import XCTest

class SearchImageUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /*
     Steps:
     1. swipe down table view (for searchBar to appear if tv was empty)
     2. tap on search bar
     3. write "Cat"
     4. press search
     5. -- Check collectionView, footer activity indicator, ImageCV are visible --
     6. swipe up the collectionView
     7. tap cancel
     8. tap on search bar
     9. write "Dog"
     10. press search
     11. -- Check collectionView, footer activity indicator, ImageCV are visible --
     12. swipe up the collectionView
     13. tap cancel
     14. Select "Cat" from history tableView
     15. press search
     16. -- Check collectionView, footer activity indicator, ImageCV are visible --
     */
    func testSearchCancelChooseFromTableView() throws {
        let app = XCUIApplication()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element.swipeDown()
        
        let searchImageNavigationBar = app.navigationBars["Search Image"]
        let searchSearchField = searchImageNavigationBar.searchFields["Search"]
        searchSearchField.tap()
        
        searchSearchField.setText(text: "Cat", application: app)
        let searchButton = app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards",".buttons[\"search\"]",".buttons[\"Search\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        searchButton.tap()
        
        let searchResultsCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews["Search results"]/*[[".otherElements[\"Double-tap to dismiss\"].collectionViews[\"Search results\"]",".collectionViews[\"Search results\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //Check collectionView visible
        XCTAssertEqual(searchResultsCollectionView.exists, true)
        //Check footer activity indicator visible
        XCTAssertEqual(searchResultsCollectionView.children(matching: .any).element(matching: .any, identifier: "ActivityFooter").exists, true)
        sleep(3)
        //Check if images cells are visible
        XCTAssertEqual(searchResultsCollectionView.children(matching: .cell).element(matching: .any, identifier: "ImageCVCell").exists, true)
        
        searchResultsCollectionView.swipeUp()
        searchResultsCollectionView.swipeUp()
        
        let cancelButton = searchImageNavigationBar.buttons["Cancel"]
        cancelButton.tap()
        
        searchSearchField.tap()
        searchSearchField.setText(text: "Dog", application: app)
        searchButton.tap()
        
        //Check collectionView visible
        XCTAssertEqual(searchResultsCollectionView.exists, true)
        //Check footer activity indicator visible
        XCTAssertEqual(searchResultsCollectionView.children(matching: .any).element(matching: .any, identifier: "ActivityFooter").exists, true)
        sleep(3)
        //Check if images cells are visible
        XCTAssertEqual(searchResultsCollectionView.children(matching: .cell).element(matching: .any, identifier: "ImageCVCell").exists, true)
        
        searchResultsCollectionView.swipeUp()
        
        cancelButton.tap()
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Cat"]/*[[".cells.staticTexts[\"Cat\"]",".staticTexts[\"Cat\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        searchButton.tap()
        
        //Check collectionView visible
        XCTAssertEqual(searchResultsCollectionView.exists, true)
        //Check footer activity indicator visible
        XCTAssertEqual(searchResultsCollectionView.children(matching: .any).element(matching: .any, identifier: "ActivityFooter").exists, true)
        sleep(3)
        //Check if images cells are visible
        XCTAssertEqual(searchResultsCollectionView.children(matching: .cell).element(matching: .any, identifier: "ImageCVCell").exists, true)
    }

    func testSearch() throws {
        let app = XCUIApplication()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element.swipeDown()
        
        let searchImageNavigationBar = app.navigationBars["Search Image"]
        searchImageNavigationBar.searchFields["Search"].tap()
        searchImageNavigationBar.searchFields["Search"].setText(text: "Cat", application: app)

        searchImageNavigationBar.buttons["Cancel"].tap()
    }
    
    func testCancel() throws {
        let app = XCUIApplication()
        app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element.swipeDown()
        
        let searchImageNavigationBar = app.navigationBars["Search Image"]
        searchImageNavigationBar.searchFields["Search"].tap()
        searchImageNavigationBar.searchFields["Search"].setText(text: "Cat", application: app)

        searchImageNavigationBar.buttons["Cancel"].tap()
    }

}
