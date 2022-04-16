//
//  SearchImageProtocol.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import Foundation

//Presenter <-> View
protocol SearchImagePresenterToViewProtocol: class {
    var presenter: SearchImageViewToPresenterProtocol! { get set }
    
    //func showLoadingIndicator()
    //func hideLoadingIndicator()
    //func reloadData()
}

protocol SearchImageViewToPresenterProtocol: class {
    var view: SearchImagePresenterToViewProtocol? { get set }
    //var numberOfRows: Int { get }
    var recentSearches: [String] { get }

    
    func viewDidLoad()
    //func configure(cell: SearchImageCellView, indexPath: IndexPath)
    //func searchBy(text: String)
    //func didSelect(indexPath: IndexPath)
}

//Presenter -> Router
protocol SearchImagePresenterToRouterProtocol {
    //func pushSearchImageDetailsViewController(SearchImage: SearchImage)
}

//Presenter <-> Interactor
protocol SearchImagePresenterToInteractorProtocol {
    var presenter: SearchImageInteractorToPresenterProtocol? { get set }
    
    //func getSearchImage()
}

protocol SearchImageInteractorToPresenterProtocol: class {
    //func SearchImageFetchedSuccessfully(SearchImage: SearchImage)
    //func SearchImageFetchingFailed(withError error: Error)
}
