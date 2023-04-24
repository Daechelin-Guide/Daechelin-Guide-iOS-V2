//
//  ReviewModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Alamofire
import LinkNavigator

class ReviewModel: ObservableObject {
    
    func postReview(star: Double, message: String, localDate: String, navigator: LinkNavigatorType) {
        
        if star == 0 {
            print("별점이 0입니다.")
            
            let alertModel = Alert(
                title: "앗!",
                message: "별점을 깜빡하셨어요 :)",
                buttons: [.init(title: "확인", style: .default, action: { print("별점을 적지 않았음.") })],
                flagType: .default)
            
            navigator.alert(target: .default, model: alertModel)
        } else {
            
            AF.request("\(API)/breakfast/review/create",
                       method: .post,
                       parameters: [
                        "date": localDate
                       ],
                       encoding: JSONEncoding.default,
                       headers: ["Content-Type": "application/json"]
            ) { $0.timeoutInterval = 5 }
                .validate()
                .responseData { response in
                    switch response.result {
                        
                    case .success:
                        
                        let alertModel = Alert(
                            title: "성공!",
                            message: "소중한 리뷰 감사합니다! :)",
                            buttons: [.init(title: "확인", style: .default, action: { print("리뷰 성공적으로 보냄.") })],
                            flagType: .default)
                        
                        navigator.alert(target: .default, model: alertModel)
                        
                    case .failure:
                        print("Post 실패")
                    }
                }
        }
        
    }
}
