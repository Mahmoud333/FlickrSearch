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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        title = "Search"
        //let layout = CampaignLayout()
        //layout.delegate = self
        //collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ImageCVCell", bundle: .main), forCellWithReuseIdentifier: "ImageCVCell")
    }
}

//extension SearchImageResultViewController: CampaignLayoutDelegate {
//    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath, cellWidth: CGFloat) -> CGFloat {
//        return CGFloat(Int.random(in: 100...150))
//    }
//}

extension SearchImageResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10.0 + 10.0 + 10.0 //left + middle + right
        return CGSize(width: (collectionView.frame.width - padding) / 2, height: 120)
    }
}

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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item >= presenter.numberOfRows - 4 {
            presenter.getNextPage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ActivityFooter", for: indexPath) as! ActivityFooter
            if presenter.isLoading {
                footer.activityIndicator.startAnimating()
            } else {
                footer.activityIndicator.isHidden = true
                footer.activityIndicator.hidesWhenStopped = true
                footer.activityIndicator.stopAnimating()
            }
            return footer
        default: return UICollectionReusableView()
        }
    }
}


extension SearchImageResultViewController: SearchImageResultPresenterToViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.collectionViewLayout.invalidateLayout()
        }
    }
}
