//
//  MainView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import LinkNavigator

struct MainView: View {
    
    @State var isLoading: Bool = true
    
    @State var selectedDate = Date()
    
    @State var week: String = ""
    @State var breakfast: String = "조식이 없는 날입니다 :)"
    @State var lunch: String = "중식이 없는 날입니다 :)"
    @State var dinner: String = "석식이 없는 날입니다 :)"
    
    @State var date: String = getNowDate()
    
    @State var localDate: String = ""
    
    @State var mealTime: String = ""
    
    @ObservedObject var modal = MainModel()
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        if isLoading {
            
            LaunchScreenView()
                .onAppear {
                    getMenu(date)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                        withAnimation(.easeInOut(duration: 0.7)) {
                            isLoading = false
                            print(breakfast, lunch, dinner, week)
                        }
                    }
                }
            
        } else {
            
            VStack(spacing: 0) {
                
                HStack {
                    Image("NavigationBarLogo")
                        .resizable()
                        .frame(width: 129, height: 20)
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            navigator.next(paths: ["Ranking"], items: [:], isAnimated: true)
                        }) {
                            Image("ranking")
                        }
                        
                        Button(action: {
                            navigator.next(paths: ["Setting"], items: [:], isAnimated: true)
                        }) {
                            Image("setting")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                Divider()
                
                ScrollView {
                    
                    VStack(spacing: 20) {
                        
                        HStack(spacing: 10) {
                            Button(action: {
                                date = minus24Hours(from: localDate)!
                                
                                getMenu(date)
                            }) {
                                Image("arrow-left")
                            }
                            
                            Button(action: {
                                
                                getMenu(getNowDate())
                                
                            }) {
                                Text("\(week)")
                                    .setFont(14, .medium)
                                    .foregroundColor(Colors.text.color)
                                    .frame(width: 166 ,height: 30)
                                    .background(.white)
                                    .cornerRadius(15)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                    }
                            }
                            
                            Button(action: {
                                date = add24Hours(from: localDate)!
                                
                                getMenu(date)
                            }) {
                                Image("arrow-right")
                                
                            }
                        }
                        
                        MenuView("조식", breakfast) {
                            if breakfast != "조식이 없는 날입니다 :)" {
                                navigator.next(paths: ["meal"], items: [
                                    "mealTime": "breakfast",
                                    "menu": breakfast,
                                    "week": week,
                                    "localDate": localDate
                                ], isAnimated: true)
                            }
                        }
                        
                        MenuView("중식", lunch) {
                            if lunch != "중식이 없는 날입니다 :)" {
                                navigator.next(paths: ["meal"], items: [
                                    "mealTime": "lunch",
                                    "menu": lunch,
                                    "week": week,
                                    "localDate": localDate
                                ], isAnimated: true)
                            }
                        }
                        
                        MenuView("석식", dinner) {
                            if ( dinner != "석식이 없는 날입니다 :)" ) {
                                navigator.next(paths: ["meal"], items: [
                                    "mealTime": "dinner",
                                    "menu": dinner,
                                    "week": week,
                                    "localDate": localDate
                                ], isAnimated: true)
                            }
                        }
                        
                        Button(action: {
                            
                            let alertModel = Alert(
                                title: "앗!",
                                message: "지금은 급식데이 기간이 아닌 것 같네요",
                                buttons: [.init(title: "확인", style: .default, action: {
                                    print("확인")
                                })],
                                flagType: .default)
                            
                            navigator.alert(target: .default, model: alertModel)

                        }) {
                            HStack {
                                Image("급식데이")
                                    .padding(.bottom, 6)
                                
                                VStack(alignment: .leading) {
                                    Text("대소고 맛.잘.알을 찾습니다!")
                                        .setFont(18, .medium)
                                        .foregroundColor(.black)
                                    
                                    Text("급식데이 투표하러 가기")
                                        .setFont(14, .regular)
                                        .foregroundColor(Colors.text.color)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                        }
                        .frame(height: 120)
                        .frame(maxWidth:  .infinity)
                        .background(.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Colors.mealday.color, lineWidth: 1)
                        )
                        .autocapitalization(.none)
                        
                        
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 16)
                    
                }
                .setBackground()
                .refreshable {
                    getMenu(date)
                }
            }
        }
        
    }
    
    func getMenu(_ date: String) {
        
        modal.getMenuData(date) { result in
            guard let result = result else { return }
            
            breakfast = result.breakfast ?? "조식이 없는 날입니다 :)"
            lunch = result.lunch ?? "중식이 없는 날입니다 :)"
            dinner = result.dinner ?? "석식이 없는 날입니다 :)"
            week = result.date!
            localDate = result.localDate!
        }
    }
    
}

