//
//  SearchImageInteractor.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import Foundation

class SearchImageInteractor: SearchImagePresenterToInteractorProtocol {
    
    weak var presenter: SearchImageInteractorToPresenterProtocol?
    
    //private let SearchImageWorker = SearchImageWorker()
    
    //func getSearchImage() {
    //    SearchImageWorker.SearchImage(onSuccess: { (currencies) in
    //        self.presenter?.SearchImageFetchedSuccessfully(SearchImage: SearchImage)
    //    }, onError: { (error) in
    //        self.presenter?.SearchImageFetchingFailed(withError: error)
    //    })
    //}
}
