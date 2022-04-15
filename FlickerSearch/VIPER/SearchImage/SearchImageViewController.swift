//
//  SearchImageViewController.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import UIKit

class SearchImageViewController: UIViewController {
    
    var presenter: SearchImageViewToPresenterProtocol!
    
    //@IBOutlet weak var tableView: UITableView!
    //@IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension SearchImageViewController: SearchImagePresenterToViewProtocol {
    //func showLoadingIndicator() {
    //    print("Should show loading indicator")
    //}
    
    //func hideLoadingIndicator() {
    //    print("Should hide loading indicator")
    //}
}
