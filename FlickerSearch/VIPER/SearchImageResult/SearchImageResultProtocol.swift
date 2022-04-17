//
//  SearchImageResultProtocol.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import Foundation

//MARK: Presenter <-> View
protocol SearchImageResultPresenterToViewProtocol: AnyObject {
    var presenter: SearchImageResultViewToPresenterProtocol! { get set }
    
    func reloadData()
}

protocol SearchImageResultViewToPresenterProtocol: AnyObject {
    var view: SearchImageResultPresenterToViewProtocol? { get set }
    var numberOfRows: Int { get }
    var numberOfSections: Int { get }
    var searchText: String! { get set }
    var isLoading: Bool { get }
    
    func viewDidLoad()
    func searchBy(text: String)
    func getNextPage()
    func configure(cell: ImageCVCell, indexPath: IndexPath)
}

//MARK: Presenter -> Router
protocol SearchImageResultPresenterToRouterProtocol {
    func alert(title: String?, msg: String?)
}

//MARK: Presenter <-> Interactor
protocol SearchImageResultPresenterToInteractorProtocol {
    var presenter: SearchImageResultInteractorToPresenterProtocol? { get set }
    
    func searchImages(text: String, page: String, limit: String)
}

protocol SearchImageResultInteractorToPresenterProtocol: AnyObject {
    func searchImagesSuccessfully(SearchImageResult: Photos)
    func searchImagesFailed(withError error: Error)
}
