//
//  RankingModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct RankingData: Codable {
    let date: String
    let star: Double
    let menu: Menus
}

struct Ranking: Codable {
    let response: [RankingData]
}

class rankingModel: ObservableObject {
    
    func getRankingData(mealTime: String, mealCompletion: @escaping (Ranking) -> Void) {
        
        AF.request("\(API)/\(mealTime)/ranking",
                   method: .get,
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
                        if let decodedData = try? decoder.decode(Ranking.self, from: data) {
                            
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
