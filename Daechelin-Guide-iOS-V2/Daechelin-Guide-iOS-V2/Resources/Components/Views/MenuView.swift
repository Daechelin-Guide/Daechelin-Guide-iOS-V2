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
    let action: () -> Void
    
    init(_ mealTime: String,
         _ menu: String,
         _ action: @escaping () -> Void)
    {
        self.mealTime = mealTime
        self.menu = menu
        self.action = action
    }
    
    var body: some View {
        
        Button(action: action) {
            HStack {
                VStack(spacing: 0) {
                    Image("\(mealTime)")
                        .resizable()
                        .frame(width: 67, height: 67)
                    
                    MealTimeView("\(mealTime)")
                }
                .padding(.bottom, 6)
                
                Text("\(menu)")
                    .setFont(14, .regular)
                    .padding(.leading, 20)
                    .foregroundColor(Color("textColor"))
                    .multilineTextAlignment(.leading)
                
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
                .stroke(Color("\(mealTime)Color"), lineWidth: 1)
        )
        .autocapitalization(.none)
    }
    
}
