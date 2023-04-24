//
//  MealModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct Lunch: Decodable {
    var breakfast: String?
    var lunch: String?
    var dinner: String?
}

struct Meal: Decodable {
    var id, star: Int?
    var message: String?
    var lunch: [Lunch]
}

class mealModel: ObservableObject {
    
    func getMealData(localDate: String, mealTime: String, mealCompletion: @escaping (Meal?) -> Void) {
        
        print(localDate)
        
        AF.request("\(API)/\(mealTime)",
                   method: .get,
                   parameters: ["date": localDate],
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
            .validate()
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    
                    guard let value = response.value else { return }
                    guard let result = try? JSONDecoder().decode(Meal.self, from: value) else { return }
                    
                    mealCompletion(result)
                    
                case .failure(let error):
                    
                    print("실패 : \n\(error)")
                    mealCompletion(nil)
                }
            }
    }
}
