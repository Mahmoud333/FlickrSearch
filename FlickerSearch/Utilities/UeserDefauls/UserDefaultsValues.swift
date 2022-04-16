//
//  UserDefaultsValues.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import Foundation

class UserDefaultsValues {
    static let shared = UserDefaultsValues()
    private init() { }
    
    //Private keys
    private let recentSearchesKey = "com.mahmoudsmgl.PinCode.userdefaults.recentSearchesKey"
    
    //Public
    var recentSearches: [String]? {
        get {
            return UserDefaults.standard.array(forKey: recentSearchesKey) as? [String]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: recentSearchesKey)
        }
    }
}
