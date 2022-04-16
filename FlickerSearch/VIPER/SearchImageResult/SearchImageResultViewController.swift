//
//  SearchImageResultViewController.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//


import UIKit

class SearchImageResultViewController: UIViewController {
    
    var presenter: SearchImageResultViewToPresenterProtocol!
    
    @IBOutlet weak var collectionView: UICollectionView!
    //@IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Search"
        let layout = CampaignLayout()
        layout.delegate = self
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCVCell", bundle: .main), forCellWithReuseIdentifier: "ImageCVCell")
    }
}

extension SearchImageResultViewController: CampaignLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, cellWidth: CGFloat) -> CGFloat {
        return CGFloat(Int.random(in: 100...150))
    }
}

//extension SearchImageResultViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//        guard let text = searchController.searchBar.text else { return }
//    }
//}

//extension SearchImageResultViewController: UISearchBarDelegate {
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let text = searchBar.text else { return }
//        presenter.searchBy(text: text)
//    }
//}

extension SearchImageResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCVCell", for: indexPath) as? ImageCVCell else { return UICollectionViewCell() }
        presenter.configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        presenter.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfRows
    }
}


extension SearchImageResultViewController: SearchImageResultPresenterToViewProtocol {
    
    func reloadData() {
        self.collectionView.reloadData()
    }
    
    //func showLoadingIndicator() {
    //    print("Should show loading indicator")
    //}
    
    //func hideLoadingIndicator() {
    //    print("Should hide loading indicator")
    //}
}
