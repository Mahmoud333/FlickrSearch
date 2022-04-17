//
//  SearchImagePresenter.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import Foundation
import UIKit

class SearchImagePresenter {
    
    weak var view: SearchImagePresenterToViewProtocol?
    private let interactor: SearchImagePresenterToInteractorProtocol
    private let router: SearchImagePresenterToRouterProtocol
    
    var recentSearches: [String] {
        if UserDefaultsValues.shared.recentSearches == nil {
            UserDefaultsValues.shared.recentSearches = [String]()
        }
        return UserDefaultsValues.shared.recentSearches ?? [String]()
    }
    
    var numberOfRows: Int {
        recentSearches.count
    }
    var numberOfSections: Int {
        1
    }
    
    init(view: SearchImagePresenterToViewProtocol, interactor: SearchImagePresenterToInteractorProtocol, router: SearchImagePresenterToRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchImagePresenter: SearchImageViewToPresenterProtocol {
    func viewDidLoad() {
        print("SearchImagePresenter presenter viewDidLoad")
    }
    
    func configure(cell: UITableViewCell) {
        cell?.textLabel?.text = presenter.recentSearches[indexPath.row]
    }
}

extension SearchImagePresenter: SearchImageInteractorToPresenterProtocol  {

}
