//
//  MainModel.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import Alamofire

struct Menu: Decodable {
    
    var date, localDate, breakfast, dinner, lunch: String?
}

class MainModel: ObservableObject {
    
    func getMenuData(_ date: String ,completion: @escaping (Menu?) -> Void) {
        
        let components = date.components(separatedBy: "-")
        
        AF.request("\(API)/menu",
                   method: .get,
                   parameters: [
                    "year": components[0],
                    "month": components[1],
                    "day": components[2]
                   ],
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
            .validate()
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    guard let value = response.value else { return }
                    guard let result = try? JSONDecoder().decode(Menu.self, from: value) else { return }
                    
                    completion(result)
                    
                case .failure:
                    print("실패")
                }
            }
    }
}
