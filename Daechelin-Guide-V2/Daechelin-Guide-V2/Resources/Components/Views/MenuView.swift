//
//  MenuView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

struct MenuView: View {
    
    let mealTime: String
    let menu: String
    
    init(_ mealTime: String,
         _ menu: String)
    {
        self.mealTime = mealTime
        self.menu = menu
    }
    
    var body: some View {
        
        Button(action: {
        
        }) {
            VStack {
                Image("\(mealTime)")
                MealTimeView("\(mealTime)")
            }
            Text("\(menu)")
                .setFont(14, .regular)
                .foregroundColor(Color("textColor"))
        }
        .frame(height: 120)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(18)
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color("\(mealTime)Color"), lineWidth: 1)
        )
        .autocapitalization(.none)
    }
    
}
