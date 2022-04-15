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
        //BG
        //navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //navigationController.navigationBar.shadowImage = UIImage()
        //navigationController.navigationBar.isTranslucent = true
        //Title Color
        //navigationController.navigationBar.tintColor = .white
        //navigationController.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navigationController
    }
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "SearchImageViewController", bundle: Bundle.main).instantiateInitialViewController() as! SearchImageViewController
        let interactor = SearchImageInteractor()
        let router = SearchImageRouter()
        let presenter = SearchImagePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    //func pushSearchImageDetailsViewController(SearchImage: SearchImage) { //-> UIViewController
    //    let SearchImageDetailModule = SearchImageDetailsRouter.createModule(SearchImage: SearchImage)
    //    self.viewController?.navigationController?.pushViewController(currencyDetailModule, animated: true)
    //}
}
