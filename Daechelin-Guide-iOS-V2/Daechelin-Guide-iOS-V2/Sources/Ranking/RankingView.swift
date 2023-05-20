//
//  RankingView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

struct MealData: Identifiable, Hashable {
    let id: Int
    let meal, mealDate: String
}

struct RankingView: View {
    
    @ObservedObject var model = rankingModel()
    
    @State var mealTime: String = "breakfast"
    
    @State var rankingData: [MealData] = []
    @State var rankId = 1
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("대슐랭 랭킹", navigator) {
            
            ZStack(alignment: .top) {
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(rankingData, id: \.self) { data in
                        
                        VStack {
                            
                            Text("\(data.id) 위 : \(data.mealDate)")
                            
                            VStack {
                                Text("\(data.meal)")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.text.color)
                                    .multilineTextAlignment(.leading)
                            }
                            .padding(.leading, 20)
                            
                        }
                        .padding(.horizontal, 20)
                        .frame(height: 120)
                        .frame(maxWidth:  .infinity)
                        .background(.white)
                        .cornerRadius(12)
                        .autocapitalization(.none)
                    }
                }
                .onAppear {
                    getRank()
                }
                .refreshable {
                    getRank()
                }
                
                HStack {
                    
                    Button(action: {
                        mealTime = "breakfast"
                        rankingData = []
                        rankId = 1
                        getRank()
                    }) {
                        Text("조식 랭킹")
                            .setFont(16, .semibold)
                            .foregroundColor(.white)
                            .frame(width: 66, height: 26)
                            .background(AnyView(Colors.breakfast.color))
                            .cornerRadius(13)
                    }
                    
                    Button(action: {
                        mealTime = "lunch"
                        rankingData = []
                        rankId = 1
                        getRank()
                    }) {
                        Text("중식 랭킹")
                            .setFont(16, .semibold)
                            .foregroundColor(.white)
                            .frame(width: 66, height: 26)
                            .background(AnyView(Colors.lunch.color))
                            .cornerRadius(13)
                    }
                    
                    Button(action: {
                        mealTime = "dinner"
                        rankingData = []
                        rankId = 1
                        getRank()
                    }) {
                        Text("석식 랭킹")
                            .setFont(16, .semibold)
                            .foregroundColor(.white)
                            .frame(width: 66, height: 26)
                            .background(AnyView(Colors.dinner.color))
                            .cornerRadius(13)
                    }
                }
                .frame(height: 40)
            }
        }
    }
    
    func getRank() {
        
        model.getRankingData(mealTime: mealTime) { data in
            let meals = data.response.map { $0.menu.meal }
            let mealDates = data.response.map { $0.menu.mealDate }
            
            for (meal, mealDate) in zip(meals, mealDates) {
                let mealData = MealData(id: rankId, meal: meal, mealDate: mealDate)
                rankingData.append(mealData)
                rankId += 1
            }
        }
    }
}
