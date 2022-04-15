//
//  SearchImagePresenter.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import Foundation

class SearchImagePresenter {
    
    weak var view: SearchImagePresenterToViewProtocol?
    private let interactor: SearchImagePresenterToInteractorProtocol
    private let router: SearchImagePresenterToRouterProtocol
    
    //private var SearchImage: SearchImage?
    //private var SearchImageSearchResult: [SearchImage]?
    //private var isSearching = false
    
    init(view: SearchImagePresenterToViewProtocol, interactor: SearchImagePresenterToInteractorProtocol, router: SearchImagePresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchImagePresenter: SearchImageViewToPresenterProtocol {
    func viewDidLoad() {
        print("SearchImagePresenter presenter viewDidLoad")
    //    //view?.showLoadingIndicator()
    //    //interactor.getCurrencies()
    }
        
    //func configure(cell: SearchImageCellView, indexPath: IndexPath) {
    //    guard let currency = isSearching ? SearchImageSearchResult?[indexPath.row] :  currencies?.rates[indexPath.row] else { print("return \(#function)"); return }
    //    let viewModel = SearchImageCellViewModel(currency: currency)
    //    cell.configure(viewModel: viewModel)
    //}
    
    //func didSelect(indexPath: IndexPath) {
    //    //guard let currency = isSearching ? currenciesSearchResult?[indexPath.row] :  currencies?.rates[indexPath.row] else { print("return \(#function)"); return }
    //    //router.pushCurrencyDetailsViewController(currency: currency)
    //}
}

extension SearchImagePresenter: SearchImageInteractorToPresenterProtocol  {
    //func SearchImageFetchedSuccessfully(SearchImage: SearchImage) {
    //    view?.hideLoadingIndicator()
    //    self.SearchImage = SearchImage
    //    view?.reloadData()
    //}
    
    //func SearchImageFetchingFailed(withError error: Error) {
    //    view?.hideLoadingIndicator()
    //    //Failure - Should show alert
    //}
}
