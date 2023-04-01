//
//  ReviewModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire

class ReviewModel: ObservableObject {
    
    func postReview(star: Double, message: String, menu: String) {
        
        AF.request("\(API)/regis",
                   method: .post,
                   parameters: [
                    "star": star,
                    "menus": menu
                   ],
                   encoding: JSONEncoding.default,
                   headers: ["Content-Type": "application/json"]
        ) { $0.timeoutInterval = 5 }
            .validate()
            .responseData { response in
                switch response.result {
                    
                case .success:
                    print("별점 보내기 성공")
                    
                    AF.request("\(API)/comment/regis",
                               method: .post,
                               parameters: [
                                "menu": menu,
                                "message": message
                               ],
                               encoding: JSONEncoding.default,
                               headers: ["Content-Type": "application/json"]
                    ) { $0.timeoutInterval = 5 }
                        .validate()
                        .responseData { response in
                            switch response.result {
                                
                            case .success:
                                print("리뷰 보내기 성공")
                                
                            case .failure:
                                print("리뷰 보내기 실패")
                            }
                        }
                    
                case .failure:
                    print("post 실패")
                }
            }
    }
}
