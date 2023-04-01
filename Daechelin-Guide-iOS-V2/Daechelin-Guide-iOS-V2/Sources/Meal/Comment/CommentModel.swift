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
    
    var comment: [Comment] = []
    var massege: [String] = []

    func getCommentData(menu: String, commentCompletion: @escaping ([String]?) -> Void) {
        
        AF.request("\(API)/comment/message",
                   method: .get,
                   parameters: [
                    "menu": menu
                   ],
                   encoding: URLEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
        .validate()
        .responseData { response in
            switch response.result {
                
            case .success:
                guard let value = response.value else { return }
                guard let result = try? JSONDecoder().decode([Comment].self, from: value) else { return }
                
                self.comment = result
                
                for row in self.comment {
                    if row.message != "" {
                        self.massege.append(row.message!)
                    }
                }
                commentCompletion(self.massege)
                
                print("댓글성공")
                
            case .failure:
                commentCompletion(nil)
                print("댓글실패")
            }
        }
    }
}
