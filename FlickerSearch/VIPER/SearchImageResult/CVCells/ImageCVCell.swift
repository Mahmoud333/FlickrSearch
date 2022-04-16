//
//  ImageCVCell.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import UIKit
import Kingfisher

class ImageCVCellVM {
    
    var photo: Photo
    
    var imageUrl: String!
    
    init(photo: Photo) {
        self.photo = photo
        
        guard let farm = photo.farm,
              let server = photo.server,
              let id = photo.id,
              let secret = photo.secret else { return }
        self.imageUrl = "http://farm\(farm).static.flickr.com/\(server)/\(id)_\(secret).jpg"
    }
}

class ImageCVCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    var vm: ImageCVCellVM!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(vm: ImageCVCellVM) {
        guard let url = URL(string: vm.imageUrl) else { return }
        imageView.kf.indicatorType = .activity
        KF.url(url)
            .fade(duration: 0.25)
            .set(to: self.imageView)
    }
}
