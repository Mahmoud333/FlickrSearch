    //
//  MultiMoyaProvider.swift
//  FlickerSearch
//
//  Created by Mahmoud Hamad on 16/04/2022.
//

import Foundation
import Alamofire
import Moya

extension MoyaProvider {
    
    func MHRequest<T: Decodable>(target: Target,
                                 type: T.Type,
                                 completion: @escaping (Result<(T, Response), NSError>) -> () ) {
        if NetworkReachabilityManager()?.isReachable == false {
            let error = NSError(domain: "Please Check Your Internet Connection", code: -1, userInfo: nil)
            completion(.failure(error))
            return
        }

        self.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let object = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success((object, response)))
                } catch {
                    print("\nError in File: \(#file.split(separator: "/").last!), Func: \(#function), Line: \(#line) \n|>Target: \(target) \n|>Error: \(error)")
                    let error = NSError(domain: error.localizedDescription, code: -2, userInfo: nil)
                    completion(.failure(error))
                }
            case .failure(let error):
                print("\nError in File: \(#file.split(separator: "/").last!), Func: \(#function), Line: \(#line) \n|>Target: \(target) \n|>Error: \(error.localizedDescription)")
                let error = NSError(domain: error.localizedDescription, code: -6, userInfo: nil)
                completion(.failure(error))
            }
        }
        return
    }
    
    func MHRequest<T: Decodable>(target: Target,
                                 completion: @escaping (Result<(T, Response), NSError>) -> () ) {
        if NetworkReachabilityManager()?.isReachable == false {
            let error = NSError(domain: "Please Check Your Internet Connection", code: -1, userInfo: nil)
            completion(.failure(error))
            return
        }

        self.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let object = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success((object, response)))
                } catch {
                    print("\nError in File: \(#file.split(separator: "/").last!), Func: \(#function), Line: \(#line) \n|>Target: \(target) \n|>Error: \(error)")
                    let error = NSError(domain: error.localizedDescription, code: -2, userInfo: nil)
                    completion(.failure(error))
                }
            case .failure(let error):
                print("\nError in File: \(#file.split(separator: "/").last!), Func: \(#function), Line: \(#line) \n|>Target: \(target) \n|>Error: \(error.localizedDescription)")
                let error = NSError(domain: error.localizedDescription, code: -6, userInfo: nil)
                completion(.failure(error))
            }
        }
        return
    }
}
