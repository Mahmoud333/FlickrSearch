//
//  ActivityFooter.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 16/04/2022.
//

import UIKit

class ActivityFooter: UICollectionReusableView {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        accessibilityIdentifier = "ActivityFooter"
        activityIndicator.accessibilityIdentifier = "ActivityFooter.activityIndicator"
    }
}
