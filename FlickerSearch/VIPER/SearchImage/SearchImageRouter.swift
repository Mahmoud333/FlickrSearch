//
//  SearchImageRouter.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import UIKit

class SearchImageRouter: SearchImagePresenterToRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createInitForApp() -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: SearchImageRouter.createModule())
        return navigationController
    }
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "SearchImageViewController", bundle: Bundle.main).instantiateInitialViewController() as! SearchImageViewController
        view.resultVC = SearchImageResultRouter.createModule()

        let interactor = SearchImageInteractor()
        let router = SearchImageRouter()
        let presenter = SearchImagePresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
