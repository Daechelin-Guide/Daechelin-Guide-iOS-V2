//
//  RankingCellView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/02.
//

import SwiftUI

struct RankingCellView: View {
    
    let data: Rank
    
    var id: Int {
        return data.review!
    }
    
    var body: some View {
        VStack {
            
            Text("\(id) 위 : \(data.date ?? "없음")")
            
            VStack {
                Text("\(data.menu ?? "급식이 모종의 이유로 사라졌어요 ㅠㅠ")")
                    .setFont(14, .regular)
                    .foregroundColor(Color("textColor"))
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
