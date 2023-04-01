//
//  MealTimeView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

struct MealTimeView: View {
    
    let mealTime: String
    
    init(_ mealTime: String)
    {
        self.mealTime = mealTime
    }
    
    var body: some View {
        
        Text("\(mealTime)")
            .setFont(16, .semibold)
            .foregroundColor(.white)
            .frame(width: 66, height: 26)
            .background(
                Group {
                    switch mealTime {
                    case "조식":
                        AnyView(Color("\(mealTime)Color"))
                    case "중식":
                        AnyView(Color("\(mealTime)Color"))
                    case "석식":
                        AnyView(Color("\(mealTime)Color"))
                    default:
                        AnyView(Color.purple)
                    }
                }
                    .cornerRadius(13)
            )
    }
}
