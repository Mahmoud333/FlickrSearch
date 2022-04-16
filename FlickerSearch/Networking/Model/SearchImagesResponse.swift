//
//  SearchImagesResponse.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import Foundation

// MARK: - SearchImagesResponse
struct SearchImagesResponse: Codable, Equatable {
    let photos: Photos?
    let stat: String?
}

// MARK: - Photos
struct Photos: Codable, Equatable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]?
}

// MARK: - Photo
struct Photo: Codable, Equatable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
}
