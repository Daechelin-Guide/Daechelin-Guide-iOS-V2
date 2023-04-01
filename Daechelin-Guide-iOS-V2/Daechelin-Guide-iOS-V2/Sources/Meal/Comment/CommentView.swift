//
//  CommentView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI

struct CommentCellView: View {
    
    let data: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 40, height: 40)
            
            VStack(spacing: 2) {
                Text("익명의 대소고인")
                    .setFont(12, .regular)
                Text("\(data)")
                    .setFont(12, .light)
            }
        }
        .frame(height: 40)
        .frame(maxWidth: .infinity)
    }
}
