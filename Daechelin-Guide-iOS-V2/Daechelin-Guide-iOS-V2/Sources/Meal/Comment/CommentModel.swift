//
//  CommentCellModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

struct Comment: Decodable {
    var commentId: Int?
    var message: String?
    var date: String?
    var menu: String?
    var createdDate: String?
}

class commentModel: ObservableObject {
    
    @Published var comment = [Comment]()
    
    func getCommentData(menu: String, commentCompletion: @escaping (comment?) -> Void) {
        
        AF.request("\(API)/comment/message",
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
                print(response.data)
                
            case .failure:
                print(response.data)
            }
        }
    }
}
