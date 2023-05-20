//
//  settingButton.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/03.
//

import SwiftUI

struct settingButtonView: View {
    
    
    var contentColor: Color {
        
        switch content {
        case "2.1.0":
            return Colors.redText.color
            
        case "이민규":
            return Colors.redText.color
            
        default:
            return Colors.text.color
        }
    }
    
    let title: String
    let content: String
    let disable: Bool
    let action: () -> Void
    
    init(_ title: String,
         _ content: String,
         _ disable: Bool,
         _ action: @escaping () -> Void)
    {
        self.title = title
        self.content = content
        self.disable = disable
        self.action = action
    }
    
    var body: some View {
        
        Button(action: action) {
            
            HStack {
                Text(title)
                    .setFont(14, .regular)
                    .foregroundColor(Colors.text.color)
                    .padding(.leading, 10)
                
                Spacer()
                
                Text(content)
                    .setFont(14, .regular)
                    .foregroundColor(contentColor)
                    .padding(.trailing, 10)
            }
            .frame(height: 40)
            .background(disable ? Colors.disable.color : Colors.background.color)
            .cornerRadius(8)
            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
        }
        .disabled(disable)
    }
}
