//
//  MealModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct ResponseData: Codable {
    let totalStar: Double
    let response: [Review]
}

struct Review: Codable {
    let id: Int
    let star: Int
    let message: String
    let menu: Menus
}

struct Menus: Codable {
    let date: String
    let meal: String
    let mealDate: String
}


class mealModel: ObservableObject {
    
    func getReviewData(localDate: String, mealTime: String, mealCompletion: @escaping (ResponseData) -> Void) {
        
        AF.request("\(API)/\(mealTime)/review",
                   method: .get,
                   parameters: ["date": localDate],
                   encoding: URLEncoding.default
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            
            if let resdata = response.data {
                print(String(decoding: resdata, as: UTF8.self))
            }
            
            switch response.result {
                
            case .success:
                if let data = response.data {
                    
                    let decoder = JSONDecoder()
                    if let decodedData = try? decoder.decode(ResponseData.self, from: data) {
                        
                        DispatchQueue.main.async {
                            mealCompletion(decodedData)
                        }
                    }
                }
                
            case .failure:
                print("메뉴 별점, 댓글 불러오기 실패")
            }
        }
    }
}
