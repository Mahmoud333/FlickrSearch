//
//  SearchImageResultRouter.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import UIKit

class SearchImageResultRouter: SearchImageResultPresenterToRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createInitForApp() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: SearchImageResultRouter.createModule())
        return navigationController
    }
    
    static func createModule() -> SearchImageResultViewController {
        let view = UIStoryboard(name: "SearchImageResultViewController", bundle: Bundle.main).instantiateInitialViewController() as! SearchImageResultViewController

        let interactor = SearchImageResultInteractor()
        let router = SearchImageResultRouter()
        let presenter = SearchImageResultPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
