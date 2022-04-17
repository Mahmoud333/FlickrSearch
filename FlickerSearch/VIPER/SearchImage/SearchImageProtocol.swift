//
//  SearchImageProtocol.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import UIKit

//MARK: Presenter <-> View
protocol SearchImagePresenterToViewProtocol: AnyObject {
    var presenter: SearchImageViewToPresenterProtocol! { get set }
}

protocol SearchImageViewToPresenterProtocol: AnyObject {
    var view: SearchImagePresenterToViewProtocol? { get set }
    var recentSearches: [String] { get }
    var numberOfRows: Int { get }
    var numberOfSections: Int { get }
    
    func viewDidLoad()
    func configure(cell: UITableViewCell)
}

//MARK: Presenter -> Router
protocol SearchImagePresenterToRouterProtocol { }

//MARK: Presenter <-> Interactor
protocol SearchImagePresenterToInteractorProtocol {
    var presenter: SearchImageInteractorToPresenterProtocol? { get set }
}

protocol SearchImageInteractorToPresenterProtocol: AnyObject {
    
}
