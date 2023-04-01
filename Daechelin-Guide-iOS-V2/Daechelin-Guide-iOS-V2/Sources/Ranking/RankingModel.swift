//
//  RankingModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct rank: Decodable {
    var star: Double?
    var menu: String?
    var date: String?
    var review: Double?
}

class rankingModel: ObservableObject {
    
    func getRankingData(rankingCompletion: @escaping (rank?) -> Void) {
        
        AF.request("\(API)/rank",
                   method: .get,
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            switch response.result {
                
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode(rank.self, from: value) else { return }
                
                print("성공")
                
                rankingCompletion(result)
                
            case .failure(let error):
                print("실패 : \n\(error)")
                
                rankingCompletion(nil)
            }
        }
    }
}
