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
    private(set) var isLoading = false
    private var lastPage = -1
    private let limit = 40
    private var searchImageResult = [Photo]()
    var numberOfRows: Int {
        searchImageResult.count
    }
    var numberOfSections: Int {
        1
    }
    
    init(view: SearchImageResultPresenterToViewProtocol, interactor: SearchImageResultPresenterToInteractorProtocol, router: SearchImageResultPresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchImageResultPresenter: SearchImageResultViewToPresenterProtocol {
    func viewDidLoad() {
        print("SearchImageResultPresenter presenter viewDidLoad")
    }
        
    func configure(cell: ImageCVCell, indexPath: IndexPath) {
        let viewModel = ImageCVCellVM(photo: self.searchImageResult[indexPath.row])
        cell.configure(vm: viewModel)
    }
    
    
    /// Don't allow duplicates and Maximum Size is 10
    func saveSearchText(text: String) {
        //Don't allow duplicates
        if let index = UserDefaultsValues.shared.recentSearches?.firstIndex(of: text) {
            UserDefaultsValues.shared.recentSearches?.remove(at: index)
        }
        //Insert it
        UserDefaultsValues.shared.recentSearches?.insert(text, at: 0)
        //Maximum Size is 10
        if UserDefaultsValues.shared.recentSearches!.count > 10 {
            UserDefaultsValues.shared.recentSearches?.removeLast()
        }
    }
    
    func searchBy(text: String) {
        guard text != searchText else { return }
        guard isLoading == false else { return }
        isLoading = true
        searchText = text

        searchImageResult.removeAll()
        view?.reloadData()
        
        saveSearchText(text: text)
        interactor.searchImages(text: text, page: "\(1)", limit: "\(limit)")
    }
    
    func getNextPage() {
        guard isLoading == false else { return }
        isLoading = true
        interactor.searchImages(text: searchText, page: "\(lastPage + 1)", limit: "\(limit)")
    }
    
}

extension SearchImageResultPresenter: SearchImageResultInteractorToPresenterProtocol  {
    func searchImagesSuccessfully(SearchImageResult: Photos) {
        guard isLoading == true else { return }
        isLoading = false
        lastPage = SearchImageResult.page ?? 0
        guard let photos = SearchImageResult.photo else { return }
        searchImageResult.append(contentsOf: photos)
        view?.reloadData()
    }
    
    func searchImagesFailed(withError error: Error) {
        router.alert(title: "Error", msg: error.localizedDescription)
    }
}
