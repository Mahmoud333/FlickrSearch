//
//  SearchImagesResultInteractorTest.swift
//  FlickerSearchTests
//
//  Created by Mahmoud Hamad on 16/04/2022.
//

import XCTest
import Moya
@testable import FlickerSearch

class Mock_SearchImageResultInteractor_Output: SearchImageResultInteractorToPresenterProtocol {
    var isSuccess = false
    var model: Photos?
    var error: Error?
    
    func searchImagesSuccessfully(SearchImageResult: Photos) {
        isSuccess = true
        model = SearchImageResult
    }
    
    func searchImagesFailed(withError error: Error) {
        self.error = error
    }
}


class SearchImagesResultInteractorTest: XCTestCase {
    
    var sut: SearchImageResultInteractor?
    var mockOutput: Mock_SearchImageResultInteractor_Output?

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockOutput = nil
        try super.tearDownWithError()
    }
    
    /// All common status code and some custom like
    /// -1 Timeouts
    /// -2 reachability issues
    func provider(statusCode: Int) -> MoyaProvider<MultiTarget> {
        let plugins = [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
        
        //If wanted to return any status code other than 200 for testing
        let serverErrorEndpointClosure = { (target: MultiTarget) -> Endpoint in
           return Endpoint(url: URL(target: target).absoluteString,
                           sampleResponseClosure: {
               /* data relevant to 500 error */
               switch statusCode {
               case -1:
                   return EndpointSampleResponse.networkError(NSError())
               case 200:
                   return EndpointSampleResponse.networkResponse(statusCode, target.sampleData )
               default:
                   return EndpointSampleResponse.networkResponse(statusCode, "".data(using: .utf8)! )
               }
           },
                           method: target.method,
                           task: target.task,
                           httpHeaderFields: target.headers)
        }
        
        let provider = MoyaProvider<MultiTarget>.init(endpointClosure: serverErrorEndpointClosure,
                                                      stubClosure: MoyaProvider.immediatelyStub)
        
        return provider
    }

    func testSuccess() throws {
        sut = SearchImageResultInteractor(provider: provider(statusCode: 200))
        mockOutput = Mock_SearchImageResultInteractor_Output()
        sut?.presenter = mockOutput
        
        sut?.searchImages(text: "Cat", page: "1", limit: "1")
        XCTAssertEqual(mockOutput?.isSuccess, true)
        XCTAssertEqual(mockOutput?.model?.page, 1)
        XCTAssertEqual(mockOutput?.model?.perpage, 1)
        XCTAssertEqual(mockOutput?.model?.photo?.count, 1)
        XCTAssertEqual(mockOutput?.model?.photo?.first?.title?.contains("Cat"), true)
    }
    
    func testFailedServerError() throws {
        sut = SearchImageResultInteractor(provider: provider(statusCode: 500))
        mockOutput = Mock_SearchImageResultInteractor_Output()
        sut?.presenter = mockOutput
        
        sut?.searchImages(text: "Cat", page: "1", limit: "1")
        XCTAssertEqual(mockOutput!.isSuccess, false)
        XCTAssertNil(mockOutput?.model)
        XCTAssertNotNil(mockOutput?.error)
        print(mockOutput?.error?.localizedDescription)
    }
    
    func testNotFound() throws {
        sut = SearchImageResultInteractor(provider: provider(statusCode: 404))
        mockOutput = Mock_SearchImageResultInteractor_Output()
        sut?.presenter = mockOutput
        
        sut?.searchImages(text: "Cat", page: "1", limit: "1")
        XCTAssertEqual(mockOutput!.isSuccess, false)
        XCTAssertNil(mockOutput?.model)
        XCTAssertNotNil(mockOutput?.error)
        print(mockOutput?.error?.localizedDescription)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
