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
    
    @State var strokeColor: Color = Colors.breakfast.color
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("대슐랭 랭킹", navigator) {
            
            ZStack(alignment: .top) {
                
                ScrollView(showsIndicators: false) {
                    
                    ForEach(rankingData, id: \.self) { data in
                        
                        HStack {
        
                            VStack(alignment: .leading) {
                                
                                Text("👑 \(data.id) 위 : \(data.mealDate)")
                                    .setFont(20, .regular)
                                    .padding(.top, 20)
                                
                                Text("\(data.meal)")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.text.color)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 20)
                                    .padding(.trailing, 40)
                            }
                            .padding(.leading, 20)
                            
                            Spacer()
                        }
                        .frame(height: 100)
                        .frame(maxWidth:  .infinity)
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(strokeColor, lineWidth: 1)
                        )
                        .autocapitalization(.none)
                        .padding(.top, 10)
                    }
                    .padding(.top, 66)
                }
                .padding(.horizontal, 16)
                .onAppear {
                    getRank()
                }
                .refreshable {
                    getRank()
                }
                
                HStack {
                    
                    Button(action: {
                        mealTime = "breakfast"
                        getRank()
                    }) {
                        if mealTime == "breakfast" {
                            Text("조식 랭킹")
                                .setFont(16, .medium)
                                .foregroundColor(.white)
                                .frame(width: 110, height: 26)
                                .background(Colors.breakfast.color)
                                .cornerRadius(10)
                        } else {
                            Text("조식 랭킹")
                                .setFont(16, .medium)
                                .foregroundColor(Colors.text.color)
                                .frame(width: 110, height: 26)
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Colors.breakfast.color, lineWidth: 1)
                                )
                                .cornerRadius(10)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        mealTime = "lunch"
                        getRank()
                    }) {
                        if mealTime == "lunch" {
                            Text("중식 랭킹")
                                .setFont(16, .medium)
                                .foregroundColor(.white)
                                .frame(width: 110, height: 26)
                                .background(Colors.lunch.color)
                                .cornerRadius(10)
                        } else {
                            Text("중식 랭킹")
                                .setFont(16, .medium)
                                .foregroundColor(Colors.text.color)
                                .frame(width: 110, height: 26)
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Colors.lunch.color, lineWidth: 1)
                                )
                                .cornerRadius(10)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        mealTime = "dinner"
                        getRank()
                    }) {
                        if mealTime == "dinner" {
                            Text("석식 랭킹")
                                .setFont(16, .medium)
                                .foregroundColor(.white)
                                .frame(width: 110, height: 26)
                                .background(Colors.dinner.color)
                                .cornerRadius(10)
                        } else {
                            Text("석식 랭킹")
                                .setFont(16, .medium)
                                .foregroundColor(Colors.text.color)
                                .frame(width: 110, height: 26)
                                .background(.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Colors.dinner.color, lineWidth: 1)
                                )
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
            }
        }
    }
    
    func getRank() {
        
        switch mealTime {
            
        case "lunch":
            strokeColor =  Colors.lunch.color
        case "dinner":
            strokeColor =  Colors.dinner.color
        default:
            strokeColor =  Colors.breakfast.color
        }
        
        rankingData = []
        rankId = 1
        
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
