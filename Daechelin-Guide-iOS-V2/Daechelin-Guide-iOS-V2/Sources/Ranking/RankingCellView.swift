//
//  RankingCellView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/02.
//

import SwiftUI

struct RankingCellView: View {
    
    let data: rank
    
    var id: Int {
        return data.review!
    }
    
    var body: some View {
        HStack {
            VStack {
                Text("1 위 : \(id)")
                    .setFont(20, .regular)
                    .padding(.top, 20)
                
                Text("암주닉")
                    .setFont(14, .regular)
                    .foregroundColor(Color("textColor"))
                    .multilineTextAlignment(.leading)
            }
            .padding(.leading, 20)
            
            Spacer()
            
        }
        .padding(.horizontal, 20)
        .frame(height: 120)
        .frame(maxWidth:  .infinity)
        .background(.white)
        .cornerRadius(12)
        .autocapitalization(.none)
    }
}
