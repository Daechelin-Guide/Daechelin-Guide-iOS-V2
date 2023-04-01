//
//  MainView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import LinkNavigator

struct MainView: View {
    
    @State var week: String = "날짜를 불러오는 중..."
    @State var breakfast: String = "조식을 불러오는 중..."
    @State var lunch: String = "중식을 불러오는 중..."
    @State var dinner: String = "석식을 불러오는 중..."
    @State var date: String = ""
    @State var mealTime: String = ""
    
    @ObservedObject var modal = MainModel()
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    HStack(spacing: 10) {
                        Button(action: {  }) {
                            Image("arrow-left")
                        }
                        
                        Text("\(week)")
                            .setFont(14, .medium)
                            .frame(width: 160 ,height: 30)
                            .background(.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                            .autocapitalization(.none)
                        
                        Button(action: {  }) {
                            Image("arrow-right")
                            
                        }
                    }
                    
                    MenuView("조식", breakfast) {
                        navigator.next(paths: ["Meal"], items: [
                            "week": week,
                            "date": date,
                            "mealTime": "break"
                        ], isAnimated: true)
                    }
                    
                    MenuView("중식", lunch) {
                        navigator.next(paths: ["Meal"], items: [
                            "week": week,
                            "date": date,
                            "mealTime": "lunch"
                        ], isAnimated: true)
                    }
                    
                    MenuView("석식", dinner) {
                        navigator.next(paths: ["Meal"], items: [
                            "week": week,
                            "date": date,
                            "mealTime": "dinner"
                        ], isAnimated: true)
                    }
                    
                    Button(action: {
                        print("급식데이")
                    }) {
                        HStack {
                            Image("mealday")
                                .padding(.bottom, 6)
                            
                            VStack(alignment: .leading) {
                                Text("대소고 맛잘알을 찾습니다!")
                                    .setFont(18, .medium)
                                    .foregroundColor(.black)
                                
                                Text("급식데이 투표하러 가기")
                                    .setFont(14, .regular)
                                    .foregroundColor(Color("textColor"))
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 20)
                    }
                    .frame(height: 120)
                    .frame(maxWidth:  .infinity)
                    .background(.white)
                    .cornerRadius(18)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(Color("급식데이Color"), lineWidth: 1)
                    )
                    .autocapitalization(.none)

                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal, 16)
                .navigationBarItems(
                    leading:
                        Image("NavigationBarLogo")
                        .resizable()
                        .frame(width: 129, height: 20),
                    
                    trailing:
                        HStack(spacing: 10) {
                            Button(action: {
                                
                                
                            }) { Image("ranking") }
                            
                            Button(action: {
                                navigator.next(paths: ["Setting"], items: [:], isAnimated: true)
                                
                            }) { Image("setting") }
                        }
                )
                
            }
            .setBackground()
            .onAppear {
                modal.getMenuData { result in
                    guard let result = result else { return }
                    
                    breakfast = result.data.breakfast!
                    lunch = result.data.lunch!
                    dinner = result.data.dinner!
                    week = result.data.week!
                    date = result.data.date
                }
                
            }
            .refreshable {
                modal.getMenuData { result in
                    guard let result = result else { return }
                    
                    breakfast = result.data.breakfast!
                    lunch = result.data.lunch!
                    dinner = result.data.dinner!
                    week = result.data.week!
                }
            }
        }
        
    }
}
