//
//  MealView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import LinkNavigator

struct MealView: View {
    
    @State var week: String
    @State var date: String
    @State var mealTime: String
    
    @State var menu: String = "메뉴를 불러오는 중..."
    @State var star: Int = 5
    @State var str = ""
    
    @ObservedObject var modal = mealModel()
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Text(week)
                
                MealTimeView(str)
                    .onAppear {
                        switch mealTime {
                        case "breakfast":
                            str = "조식"
                        case "lunch":
                            str = "중식"
                        case "dinner":
                            str = "석식"
                        default:
                            str = ""
                        }
                    }
                
                Text(menu)
                
                Text("\(star)")
            }
        }
        .onAppear {
            modal.getMealData(date: date, mealTime: mealTime, mealCompletion: {
                result in
                guard let result = result else { return }
                
                switch mealTime {
                case "break":
                    menu = result.breakfast!
                case "lunch":
                    menu = result.lunch!
                default:
                    menu = result.dinner!
                }
                
            }, starCompletion: {
                result in
                guard let result = result else { return }
                print(result.star)
                
            }, commentCompletion: {
                result in
                guard let result = result else { return }
                print(result.message)
                
            })
            
        }
        .refreshable {
            
        }
    }
}
