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
    
    var imagesProvider: MoyaProvider<MultiTarget>
        
    init(provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])) {
        imagesProvider = provider
    }
    
    func searchImages(text: String, page: String, limit: String) {
        let target = MultiTarget(MoyaImages.searchImages(text: text, page: page, limit: limit))
        imagesProvider.MHRequest(target: target, type: SearchImagesResponse.self) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success((model, _)):
                guard let photos = model.photos else { return }
                strongSelf.presenter?.searchImagesSuccessfully(SearchImageResult: photos)
            case let .failure(error):
                strongSelf.presenter?.searchImagesFailed(withError: error)
            }
        }
    }
}
