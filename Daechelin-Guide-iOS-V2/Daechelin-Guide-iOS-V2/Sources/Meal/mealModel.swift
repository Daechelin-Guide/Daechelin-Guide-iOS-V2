//
//  MealModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct meal: Decodable {
    var breakfast: String?
    var lunch: String?
    var dinner: String?
}

struct star: Decodable {
    var star: Double?
    var menu: String?
    var date: String?
}

class mealModel: ObservableObject {
    
    func getMealData(date: String, mealTime: String, mealCompletion: @escaping (meal?) -> Void, starCompletion: @escaping (star?) -> Void) {
        
        AF.request("\(API)/\(mealTime)",
                   method: .get,
                   parameters: [
                    "date": date
                   ],
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            switch response.result {
                
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(meal.self, from: value) else { return }
                
                let menu: String
                
                switch mealTime {
                case "break":
                    menu = result.breakfast!
                case "lunch":
                    menu = result.lunch!
                default:
                    menu = result.dinner!
                }
                
                mealCompletion(result)
                
                AF.request("\(API)/star",
                           method: .get,
                           parameters: [
                            "menu": menu
                           ],
                           encoding: URLEncoding.default,
                           headers: ["Content-Type": "application/json"]
                )
                .validate()
                .responseData { response in
                    switch response.result {
                        
                    case .success:
                        guard let value = response.value else { return }
                        guard let result = try? JSONDecoder().decode(star.self, from: value) else { return }
                        
                        starCompletion(result)
                        
                    case .failure:
                        print("별점 실패")
                        starCompletion(nil)
                    }
                }
                
            case .failure(let error):
                print("실패 : \n\(error)")
                mealCompletion(nil)
            }
        }
    }
}
