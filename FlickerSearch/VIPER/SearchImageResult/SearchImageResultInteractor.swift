//
//  SearchImageResultInteractor.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import Foundation
import Moya

class SearchImageResultInteractor: SearchImageResultPresenterToInteractorProtocol {
    
    weak var presenter: SearchImageResultInteractorToPresenterProtocol?
    
    let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
    lazy var imagesProvider = MoyaProvider<MoyaImages>(plugins: [plugin])
    
    func searchImages(text: String, page: String, limit: String) { //, onSuccess: @escaping (RestaurantList) -> (), onError: @escaping (NSError) -> ()
        /*imagesProvider.MARequest(target: .searchImages(text: text, page: page, limit: limit), onSuccess: { (resturants: RestaurantList, data, code, _) in
            onSuccess(resturants)
        }) { (error, code) in
            onError(error)
        }*/
        
        imagesProvider.request(.searchImages(text: text, page: page, limit: limit)) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(moyaResponse):
                let statusCode = moyaResponse.statusCode
                let data = moyaResponse.data
                do {
                    let object = try JSONDecoder().decode(SearchImagesResponse.self, from: data)
                    guard let photos = object.photos else { return }
                    strongSelf.presenter?.searchImagesSuccessfully(SearchImageResult: photos)
                } catch {
                    print("\nError in File: \(#file.split(separator: "/").last!), Func: \(#function), Line: \(#line) \n|>Error: \(error)")
                    strongSelf.presenter?.searchImagesFailed(withError: error)
                }
            case let .failure(error):
                // this means there was a network failure - either the request
                // wasn't sent (connectivity), or no response was received (server
                // timed out).  If the server responds with a 4xx or 5xx error, that
                // will be sent as a ".success"-ful response.
                strongSelf.presenter?.searchImagesFailed(withError: error)
            }
        }
    }
}
