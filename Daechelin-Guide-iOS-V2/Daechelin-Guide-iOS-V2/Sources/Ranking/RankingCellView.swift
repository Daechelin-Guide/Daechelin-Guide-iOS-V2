//
//  RankingCellView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/02.
//

import SwiftUI

struct RankingCellView: View {
    
    var rankingData: RankingData

    var body: some View {
        VStack {
            
            Text("엄준식")

            VStack {
                Text("")
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
