//
//  ReviewView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator
import Cosmos

struct ReviewView: View {
    
    @State var menu: String
    
    @State var review: String = ""
    
    @State var star: Double = 0
    @State var updateOnTouch: Bool = true
    
    @State var buttonDisabled: Bool = true
    
    @ObservedObject var model = ReviewModel()
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("리뷰 달기", navigator) {
            
            VStack(alignment: .leading, spacing: 20) {
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $review)
                        .setFont(15, .regular)
                        .foregroundColor(Color("textColor"))
                        .padding([.top, .leading], 10)
                    
                    if review.isEmpty {
                        Text("리뷰를 작성해주세요.")
                            .setFont(15, .regular)
                            .foregroundColor(Color("textColor").opacity(0.5))
                            .padding(.leading, 16)
                            .padding(.top, 18)
                    }
                    
                    HStack {
                        Text("\(review.count) / 50")
                            .setFont(15, .bold)
                            .foregroundColor(Color("textColor").opacity(0.6))
                        
                        Spacer()
                        
                        Button(action: {
                            model.postReview(star: star, message: review, menu: menu)
                        }) {
                            Text("완료")
                                .setFont(15, .bold)
                                .foregroundColor(Color("textColor").opacity(0.6))
                        }
                        .disabled(isButtonDisabled(review.count, 50))
                    }
                    .padding(.top, 90)
                    .padding(.horizontal, 16)
                    
                }
                .background(.white)
                .frame(height: 120)
                .cornerRadius(12)
                
                
                MyCosmosView(star: $star, updateOnTouch: $updateOnTouch)
                    .padding(.leading, 8)
                
                Spacer()
            }
            .padding([.top, .horizontal], 16)
            
        }
    }
}
