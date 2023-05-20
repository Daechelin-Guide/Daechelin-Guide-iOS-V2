//
//  ReviewModel.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

class ReviewModel: ObservableObject {
    
    func postReview(star: Double, message: String, mealTime: String, localDate: String, navigator: LinkNavigatorType) {
        
        print(mealTime, localDate)
        
        if star == 0 {
            
            let alertModel = Alert(
                title: "앗!",
                message: "별점을 깜빡하셨어요 :)",
                buttons: [.init(title: "확인", style: .default, action: { print("별점을 적지 않았음.") })],
                flagType: .default)
            
            navigator.alert(target: .default, model: alertModel)
        } else {
            
            let url = "/\(mealTime)/review/create?date=\(localDate)"
            
            let params: [String: Any] = ["star": star,
                                         "message": message]
            
            Requests.simple(url, .post, params: params, failure: {
                print("url: \(url)\n실패")
            }) {
                
            }
            
            let alertModel = Alert(
                title: "성공!",
                message: "소중한 리뷰 감사합니다! :)",
                buttons: [.init(title: "확인", style: .default, action: {
                    navigator.back(isAnimated: true)
                })],
                flagType: .default)
            
            navigator.alert(target: .default, model: alertModel)
        }
        
    }
}
