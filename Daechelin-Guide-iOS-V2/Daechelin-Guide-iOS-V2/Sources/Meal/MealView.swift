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
    
    //조식.중식.석식 구분
    @State var mealTime: String
    
    //급식 메뉴
    @State var menu: String
    
    //localDate
    @State var localDate: String
    
    //날짜
    @State var week: String
    
    @State var star: Double = 0.0
    
    @State var message: [String] = []
    
    @State var updateOnTouch: Bool = false
    
    @State var mealTimeStr: String = "조식"
    
    var menuColor: Color {
        
        switch mealTimeStr {
            
        case "중식":
            return Colors.lunch.color
        case "석식":
            return Colors.dinner.color
        default:
            return Colors.breakfast.color
        }
    }
    
    @State var data:[String] = []
    
    @ObservedObject var mealModal = mealModel()
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("급식 상세 정보", navigator) {
            
            VStack {
                
                VStack(spacing: 10) {
                    Text(String(week.dropFirst(6)))
                    
                        .setFont(18, .medium)
                        .foregroundColor(Colors.text.color)
                        .padding(.top, 20)
                    
                    MealTimeView(mealTimeStr)
                    
                    MyCosmosView(star: $star, updateOnTouch: $updateOnTouch)
                    
                    Divider()
                        .frame(width: 220, height: 1)
                        .background(menuColor.opacity(0.5))
                    
                    Text(menu.replacingOccurrences(of: ",", with: "\n"))
                        .setFont(16, .regular)
                        .foregroundColor(Colors.text.color)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(menuColor, lineWidth: 1)
                )
                .autocapitalization(.none)
                
                ZStack {
                    ScrollView(showsIndicators: false) {
                        
                        ForEach(message.reversed(), id: \.self) { data in
                            CommentCellView(data: data)
                        }
                        .padding(.top, 10)
                    }
                    
                    GeometryReader { geo in
                        
                        Button(action: {
                            navigator.next(paths: ["review"], items: ["mealTime": mealTime ,"localDate": localDate], isAnimated: true)
                        }) {
                            Image("\(mealTimeStr)")
                                .resizable()
                                .frame(width: 67, height: 67)
                                .background(.white)
                                .cornerRadius(34)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 34)
                                        .stroke(menuColor, lineWidth: 1)
                                )
                                .autocapitalization(.none)
                        }
                        .position(x: geo.size.width - 32,
                                  y: geo.size.height - 44)
                    }
                }
                .onAppear {
                    
                    getReview(localDate: localDate, mealTime: mealTime)
                   
                    switch mealTime {
                        
                    case "lunch": mealTimeStr = "중식"
                    case "dinner": mealTimeStr = "석식"
                    default: mealTimeStr = "조식"
                    }
                }
                .refreshable {
                    getReview(localDate: localDate, mealTime: mealTime)
                }
            }
            .padding([.horizontal, .top], 16)
        }
    }
    
    func getReview(localDate: String, mealTime: String) {
        
        mealModal.getReviewData(localDate: localDate, mealTime: mealTime) { data in
            
            star = data.totalStar
            message = data.response.map { $0.message }
            print(message)
        }
    }
}
