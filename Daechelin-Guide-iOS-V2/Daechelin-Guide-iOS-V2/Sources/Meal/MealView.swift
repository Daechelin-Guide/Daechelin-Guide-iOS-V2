//
//  MealView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import LinkNavigator
import Cosmos

struct MealView: View {
    
    @State var week: String = ""
    @State var date: String
    @State var mealTime: String
    
    @State var menu: String = "메뉴를 불러오는 중..."
    
    @State var star: Double = 0
    @State var updateOnTouch: Bool = false
    
    @State var mealTimeStr: String = "none"
    
    @State var isFirstPush = true
    
    @State var test: String = "테스트"
    @State var message:[String] = []
    
    @ObservedObject var mealModal = mealModel()
    @ObservedObject var commentModal = commentModel()
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("급식 상세 정보", navigator) {
            
            VStack {
                
                VStack(spacing: 10) {
                    Text(String(week.dropFirst(6)))
                        .setFont(18, .medium)
                        .foregroundColor(Color("textColor"))
                        .padding(.top, 20)
                    
                    MealTimeView(mealTimeStr)
                    
                    MyCosmosView(star: $star, updateOnTouch: $updateOnTouch)
                    
                    Divider()
                        .frame(width: 220, height: 1)
                        .background(Color("\(mealTimeStr)Color").opacity(0.5))
                    
                    Text(menu.replacingOccurrences(of: ",", with: "\n"))
                        .setFont(16, .regular)
                        .foregroundColor(Color("textColor"))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color("\(mealTimeStr)Color"), lineWidth: 1)
                )
                .autocapitalization(.none)
                
                ZStack {
                    ScrollView(showsIndicators: false) {
                        
                        ForEach(message, id: \.self) { data in
                            CommentCellView(data: data)
                        }
                        .padding(.top, 10)
                    }
                    
                    GeometryReader { geo in
                        
                        Button(action: {
                            navigator.next(paths: ["Review"], items: ["menu": menu], isAnimated: true)
                            isFirstPush = false
                        }) {
                            Image("조식")
                                .resizable()
                                .frame(width: 60, height: 60)
                        }
                        .position(x: geo.size.width - 20,
                                  y: geo.size.height - 44)
                    }
                }
                
                .onAppear {
                    
                    switch mealTime {
                    case "lunch": mealTimeStr = "중식"
                    case "dinner": mealTimeStr = "석식"
                    default: mealTimeStr = "조식"
                    }
                    
                    mealModal.getMealData(date: date, mealTime: mealTime, mealCompletion: { result in
                        guard let result = result else { return }
                        
                        switch mealTime {
                        case "lunch":
                            menu = result.lunch!
                        case "dinner":
                            menu = result.dinner!
                        default:
                            menu = result.breakfast!
                        }
                        
                        if isFirstPush {
                            commentModal.getCommentData(menu: menu) { result in
                                guard let result = result else { return }
                                
                                self.message = result
                            }
                        } else {
                            commentModal.getCommentData(menu: menu) { result in
                                guard let result = result else { return }
                                
                                
                                //새로 올라온 리뷰가 있다면 반영하는 코드
                                if let stringArray = result as? [String] {
                                    let lastIndex = stringArray.count - 1
                                    if lastIndex >= 0 {
                                        self.message = [stringArray[lastIndex]]
                                    }
                                }
                                
                            }
                        }
                        
                    }, starCompletion: {
                        result in
                        guard let result = result else { return }
                        
                        star = result.star!
                        
                    })
                }
            }
            .padding([.horizontal, .top], 16)
        }
    }
}
