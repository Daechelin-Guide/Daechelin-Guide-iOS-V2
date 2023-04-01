//
//  SettingView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

struct SettingView: View {
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("설정" ,navigator) {
            
            ScrollView {
                VStack(spacing: 10) {
                    
                    Text("개인정보 관리")
                        .setFont(18, .medium)
                    
                    Button(action: {
                        navigator.next(paths: ["Web"], items: [:], isAnimated: true)
                    }) {
                        
                        HStack {
                            Text("개인정보 처리방침")
                                .setFont(14, .regular)
                            
                            Spacer()
                            
                            Image("setting-arrow")
                            
                        }
                        .frame(height: 40)
                        .background(.white)
                    }
                }
                .padding(.horizontal, 16)
                
            }
            .setBackground()
        }
    }
}
