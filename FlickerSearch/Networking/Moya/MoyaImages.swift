//
//  ImagesMoya.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 15/04/2022.
//

import Foundation
import Moya
import CoreImage

enum MoyaImages {
    case searchImages(text: String, page: String, limit: String)
}

extension MoyaImages: TargetType {
    
    var baseURL: URL {
        switch self {
        case .searchImages(let text, let page, let limit):
            /*let searchedString = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)?.lowercased() ?? String()
            var urlStr = "\(BASE_URL)?page=\(page)&limit=\(limit)&q=\(searchedString)"
            //if let current = UserAccountServices.instance.currentUser , current.roles.contains("operation") {
            //  urlStr.append("&is_active=false")
            //}else{
                urlStr.append("&is_active=true")
            //}
            //============================
            print(urlStr)
            return URL(string: urlStr)!*/
            return URL(string: "https://api.flickr.com")!
        }
    }
    
    var path: String {
        switch self {
        case .searchImages(_, _, _):
            return "/services/rest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchImages(_, _, _):
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .searchImages(let text, let page, let limit):
            var parameters = [String: Any]()
            parameters["method"] = "flickr.photos.search"
            parameters["api_key"] = "9480a18b30ba78893ebd8f25feaabf17" //"6af377dc54798281790fc638f6e4da5e"
            parameters["format"] = "json"
            parameters["nojsoncallback"] = 1
            parameters["text"] = text
            parameters["page"] = page
            parameters["per_page"] = limit
            //return .requestPlain
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        switch self {
        case .searchImages:
            return .successCodes
        }
    }
}
