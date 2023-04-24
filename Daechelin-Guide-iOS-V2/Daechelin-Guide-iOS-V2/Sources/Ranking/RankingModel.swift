//
//  RankingModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct Rank: Decodable, Hashable {
    var star: Double?
    var menu: String?
    var date: String?
    var review: Int?
}

class rankingModel: ObservableObject {
    
    func getRankingData(rankingCompletion: @escaping ([Rank]?) -> Void) {
        
        AF.request("\(API)/rank").responseDecodable(of: [Rank].self) { response in
            switch response.result {
                
            case .success:
                guard let result = response.value else { return }
                rankingCompletion(result)
                
            case .failure(let error):
                print("실패 : \n\(error)")
            }
        }
    }
}
