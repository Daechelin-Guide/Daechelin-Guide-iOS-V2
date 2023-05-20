//
//  CommentCellView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI

struct CommentCellView: View {
    
    let data: String
    
    @State var modifier: [String] = ["멋진", "우아한", "귀여운", "사랑스러운", "새침한", "화려한", "품격있는"]
    
    @State private var randomModifier: String = "귀여운"
    
    var body: some View {
        
        HStack(spacing: 10) {
            Image("\(Int.random(in: 1...10))")
                .resizable()
                .frame(width: 48, height: 48)
                .overlay(
                    RoundedRectangle(cornerRadius: 32)
                        .stroke(Colors.text.color, lineWidth: 0.5)
                )
            
            VStack(alignment: .leading,spacing: 2) {
                Text("\(randomModifier) 대소고인")
                    .setFont(14, .medium)
                
                Text("\(data)")
                    .setFont(14, .light)
                
            }
            Spacer()
        }
        .frame(height: 48)
        .onAppear {
            randomModifier = modifier.randomElement() ?? "귀여운"
        }
    }
}
