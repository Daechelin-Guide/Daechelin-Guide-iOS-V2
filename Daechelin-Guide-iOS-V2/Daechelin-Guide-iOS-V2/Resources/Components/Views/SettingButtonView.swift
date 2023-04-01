//
//  SettingButtonView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI

struct SettingButtonView: View {
    
    let contents: String
    let disabled: Bool
    let item: Text
    let action: () -> Void
    
    init (_ contents: String,
          disabled: Bool,
          _ item: some View,
          _ action: @escaping () -> Void
    )
    {
        self.contents = contents
        self.disabled = disabled
        self.action = action
        self.item = item
    }
    
    var body: some View {
        
        Button(action: action) {
            
            HStack {
                Text(contents)
                    .setFont(14, .regular)
                
                Spacer()
                
                item
                
            }
        }
        .disabled(disabled)
    }
}
