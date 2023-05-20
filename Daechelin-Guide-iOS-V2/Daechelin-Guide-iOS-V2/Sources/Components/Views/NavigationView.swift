//
//  NavigationBarView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

struct Navigation<Content: View>: View {
    
    let title: String
    let content: Content
    
    init(_ title: String = "",
         _ navigator: LinkNavigatorType,
         @ViewBuilder content: () -> Content)
    {
        self.title = title
        self.navigator = navigator
        self.content = content()
    }
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Button(action: {
                    navigator.back(isAnimated: true)
                }) {
                    HStack(spacing: 0) {
                        Image("navigation-arrow")
                        
                        Text(title)
                            .setFont(18, .semibold)
                            .foregroundColor(Colors.text.color)
                    }
                    Spacer()
                }
                .padding(.leading, 16)
            }
            .padding(.vertical, 10)
            Divider()
            
            content
                .setBackground()
        }
        
    }
}
