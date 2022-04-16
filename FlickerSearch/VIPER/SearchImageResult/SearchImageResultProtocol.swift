//
//  SearchImageResultProtocol.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import Foundation

//Presenter <-> View
protocol SearchImageResultPresenterToViewProtocol: AnyObject {
    var presenter: SearchImageResultViewToPresenterProtocol! { get set }
    
    //func showLoadingIndicator()
    //func hideLoadingIndicator()
    func reloadData()
}

protocol SearchImageResultViewToPresenterProtocol: AnyObject {
    var view: SearchImageResultPresenterToViewProtocol? { get set }
    var numberOfRows: Int { get }
    var numberOfSections: Int { get }
    var searchText: String! { get set }
    
    func viewDidLoad()
    func searchBy(text: String)
    func configure(cell: ImageCVCell, indexPath: IndexPath)
    //func didSelect(indexPath: IndexPath)
}

//Presenter -> Router
protocol SearchImageResultPresenterToRouterProtocol {
    //func pushSearchImageResultDetailsViewController(SearchImageResult: SearchImageResult)
}

//Presenter <-> Interactor
protocol SearchImageResultPresenterToInteractorProtocol {
    var presenter: SearchImageResultInteractorToPresenterProtocol? { get set }
    
    func searchImages(text: String, page: String, limit: String)
}

protocol SearchImageResultInteractorToPresenterProtocol: AnyObject {
    func searchImagesSuccessfully(SearchImageResult: Photos)
    func searchImagesFailed(withError error: Error)
}
