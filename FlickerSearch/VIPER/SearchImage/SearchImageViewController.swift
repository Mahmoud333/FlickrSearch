//
//  SearchImageViewController.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import UIKit

class SearchImageViewController: UIViewController {
    
    var presenter: SearchImageViewToPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    var resultVC: SearchImageResultViewController!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupUI() {
        title = "Search Image"
        setupTableView()
        setupSearchController()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupSearchController() {
        searchController = UISearchController(searchResultsController: resultVC)
        //searchController.searchResultsUpdater = resultVC
        //searchController.searchBar.delegate = resultVC
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

extension SearchImageViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        //presenter.searchBy(text: text)
        resultVC.presenter.searchBy(text: text)
        tableView.reloadData()
    }
}

extension SearchImageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        searchController.searchBar.becomeFirstResponder()
        searchController.searchBar.text = presenter.recentSearches[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        presenter.configure(cell: cell!, indexPath: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter.numberOfSections
    }
}

extension SearchImageViewController: SearchImagePresenterToViewProtocol {

}
