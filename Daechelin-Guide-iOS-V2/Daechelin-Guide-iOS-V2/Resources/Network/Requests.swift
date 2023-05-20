//
//  Requests.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/25.
//
import SwiftUI
import Alamofire
import LinkNavigator

class Response<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}

struct ErrorResponse: Codable {
    let status: Int
    let message: String
}

class Requests {
    
    static func failure(_ data: Data?) {
        if NetworkReachabilityManager()!.isReachable {
            if let data = data {
                let decoder = JSONDecoder()
                if let decodedData = try? decoder.decode(ErrorResponse.self, from: data) {
                    print(decodedData)
                }
            }
        } else {
            UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                exit(0)
            }
        }
    }
    
    //MARK: post 와 delete 을 사용하는 함수
    static func simple(_ url: String,
                        _ method: HTTPMethod,
                        params: [String: Any]? = nil,
                        failure: @escaping () -> Void,
                        completion: @escaping () -> Void) {
        AF.request("\(API)\(url)",
                   method: method,
                   parameters: params,
                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            if let resdata = response.data {
                print(String(decoding: resdata, as: UTF8.self))
            }
            switch response.result {
                
            case .success:
                completion()
                
            case .failure:
                self.failure(response.data)
            }
        }
    }
    
    //MARK: get 을 사용하는 함수
    static func request<T: Codable>(_ url: String,
                                    _ method: HTTPMethod,
                                    params: [String: Any]? = nil,
                                    _ model: T.Type,
                                    failure: @escaping () -> Void,
                                    completion: @escaping (T) -> Void) {
        AF.request("\(API)\(url)",
                   method: method,
                   parameters: params,
                   encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
                   interceptor: Interceptor()
        ) { $0.timeoutInterval = 3 }
        .validate()
        .responseData { response in
            if let resdata = response.data {
                print(String(decoding: resdata, as: UTF8.self))
            }
            switch response.result {
                
            case .success:
                if let data = response.data {
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(Response<T>.self, from: data) {
                        DispatchQueue.main.async {
                            completion(decodedData.data)
                        }
                    }
                }
            case .failure:
                self.failure(response.data)
            }
        }
    }
}
