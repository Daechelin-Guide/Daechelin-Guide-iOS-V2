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
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    Button(action: {
                        navigator.next(paths: ["Web"], items: [:], isAnimated: true)
                    }) {
                        
                        HStack {
                            Text("개인정보 처리방침")
                                .setFont(14, .regular)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Image("setting-arrow")
                                .padding(.trailing, 10)
                            
                        }
                        .frame(height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                    }
                    
                    Text("앱 정보")
                        .setFont(18, .medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    HStack {
                        Text("현재 버전")
                            .setFont(14, .regular)
                            .padding(.leading, 10)
                        
                        Spacer()
                        
                        Text("2.0.0")
                            .setFont(14, .regular)
                            .foregroundColor(Color("redTextColor"))
                            .padding(.trailing, 10)
                        
                    }
                    .frame(height: 40)
                    .background(.white)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                    
                }
                .padding(.horizontal, 16)
                
            }
            .setBackground()
        }
    }
}
