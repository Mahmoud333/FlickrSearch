//
//  SearchImageResultPresenter.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import Foundation

class SearchImageResultPresenter {
    
    weak var view: SearchImageResultPresenterToViewProtocol?
    private let interactor: SearchImageResultPresenterToInteractorProtocol
    private let router: SearchImageResultPresenterToRouterProtocol
    
    var searchText: String!
    private var lastPage = 0
    private let limit = 20
    private var searchImageResult = [Photo]()
    var numberOfRows: Int {
        searchImageResult.count
    }
    var numberOfSections: Int {
        1
    }
    //private var SearchImageResultSearchResult: [SearchImageResult]?
    //private var isSearching = false
    
    init(view: SearchImageResultPresenterToViewProtocol, interactor: SearchImageResultPresenterToInteractorProtocol, router: SearchImageResultPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchImageResultPresenter: SearchImageResultViewToPresenterProtocol {
    func viewDidLoad() {
        print("SearchImageResultPresenter presenter viewDidLoad")
    //    //view?.showLoadingIndicator()
    //    //interactor.getCurrencies()
    }
        
    func configure(cell: ImageCVCell, indexPath: IndexPath) {
        //guard let currency = isSearching ? SearchImageResultSearchResult?[indexPath.row] :  currencies?.rates[indexPath.row] else { print("return \(#function)"); return }
        let viewModel = ImageCVCellVM(photo: self.searchImageResult[indexPath.row])
        cell.configure(vm: viewModel)
    }
    
    func searchBy(text: String) {
        //TO DO SAVE INTO USER DEFAULTS
        UserDefaultsValues.shared.recentSearches?.insert(text, at: 0)
        
        //TO DO CALL OUR SERVICE
        interactor.searchImages(text: text, page: "\(lastPage + 1)", limit: "\(limit)")
        
    }
}

extension SearchImageResultPresenter: SearchImageResultInteractorToPresenterProtocol  {
    func searchImagesSuccessfully(SearchImageResult: Photos) {
        lastPage = SearchImageResult.page ?? 0
        guard let photos =  SearchImageResult.photo else { return }
        searchImageResult.append(contentsOf: photos)
        //view?.hideLoadingIndicator()
        //self.SearchImageResult = SearchImageResult
        view?.reloadData()
    }
    
    func searchImagesFailed(withError error: Error) {
        //view?.hideLoadingIndicator()
        //Failure - Should show alert
    }
}
