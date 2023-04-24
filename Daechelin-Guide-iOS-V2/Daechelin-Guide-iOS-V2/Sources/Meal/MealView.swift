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
    
    @State var star: Double = 0
    
    @State var updateOnTouch: Bool = false
    
    @State var mealTimeStr: String = "조식"
    
    @State var message:[String] = []
    
    @ObservedObject var mealModal = mealModel()
    
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
                        
                        ForEach(Array(Set(message)).sorted().reversed(), id: \.self) { data in
                            CommentCellView(data: data)
                        }
                        .padding(.top, 10)
                    }
                    
                    GeometryReader { geo in
                        
                        Button(action: {
                            navigator.next(paths: ["Review"], items: ["localDate": localDate], isAnimated: true)
                        }) {
                            Image("\(mealTimeStr)")
                                .resizable()
                                .frame(width: 67, height: 67)
                                .background(.white)
                                .cornerRadius(34)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 34)
                                        .stroke(Color("\(mealTimeStr)Color"), lineWidth: 1)
                                )
                                .autocapitalization(.none)
                        }
                        .position(x: geo.size.width - 32,
                                  y: geo.size.height - 44)
                    }
                }
                
                .onAppear {
                    
                    switch mealTime {
                    case "lunch": mealTimeStr = "중식"
                    case "dinner": mealTimeStr = "석식"
                    default: mealTimeStr = "조식"
                    }
                    
                    mealModal.getMealData(localDate: localDate, mealTime: mealTime) { result in
                        
                        guard let result = result else { return }
                        print(result)
                        
                    }
                }
            }
            .padding([.horizontal, .top], 16)
        }
    }
}
