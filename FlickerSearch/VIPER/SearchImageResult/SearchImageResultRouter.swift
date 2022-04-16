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
        //BG
        //navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController.navigationBar.shadowImage = UIImage()
        //navigationController.navigationBar.isTranslucent = true
        //Title Color
        //navigationController.navigationBar.tintColor = .white
        //navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
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
    
    //func pushSearchImageResultDetailsViewController(SearchImageResult: SearchImageResult) { //-> UIViewController
    //    let SearchImageResultDetailModule = SearchImageResultDetailsRouter.createModule(SearchImageResult: SearchImageResult)
    //    self.viewController?.navigationController?.pushViewController(currencyDetailModule, animated: true)
    //}
}
