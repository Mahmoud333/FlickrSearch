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
        case .searchImages:
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
        return "{\"photos\":{\"page\":1,\"pages\":121227,\"perpage\":1,\"total\":121227,\"photo\":[{\"id\":\"52008631881\",\"owner\":\"187610329@N06\",\"secret\":\"6e24f2962f\",\"server\":\"65535\",\"farm\":66,\"title\":\"Shropshire Cat Rescue 2013 Misty\",\"ispublic\":1,\"isfriend\":0,\"isfamily\":0}]},\"stat\":\"ok\"}".data(using: .utf8)!
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
