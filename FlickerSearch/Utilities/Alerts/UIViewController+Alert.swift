//
//  UIViewController+Alert.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import UIKit

extension UIViewController {
    func showAlert(title: String?, msg: String?, otherActions: [UIAlertAction]? = nil) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.view.tintColor = .black
        if let otherActions = otherActions {
            otherActions.forEach { alert.addAction($0) }
        }
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
