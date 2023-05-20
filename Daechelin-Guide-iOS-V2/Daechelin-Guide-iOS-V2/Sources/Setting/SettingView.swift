//
//  SettingView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator
import Alamofire

struct SettingView: View {
    
    let navigator: LinkNavigatorType
    
    @State var isDeveloperInfoToggled = false
    @State var isVersionInfoToggled = false
    
    var body: some View {
        
        Navigation("설정" ,navigator) {
            
            ScrollView {
                
                VStack(spacing: 10) {
                    
                    Text("개인정보 관리")
                        .setFont(18, .medium)
                        .foregroundColor(Colors.text.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    Button(action: {
                        navigator.next(paths: ["Web"], items: [:], isAnimated: true)
                    }) {
                        
                        HStack {
                            Text("개인정보 처리방침")
                                .setFont(14, .regular)
                                .foregroundColor(Colors.text.color)
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
                        .foregroundColor(Colors.text.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    Button(action: {
                        isVersionInfoToggled.toggle()
                    }) {
                        
                        HStack {
                            Text("버전 정보")
                                .setFont(14, .regular)
                                .foregroundColor(Colors.text.color)
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            if isVersionInfoToggled {
                                Image("arrow-down")
                                    .padding(.trailing, 10)
                            } else {
                                Image("setting-arrow")
                                    .padding(.trailing, 10)
                            }
                            
                        }
                        .frame(height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                    }
                    
                    if isVersionInfoToggled {
                        
                        settingButtonView("현재 버전", "2.1.0", true) { }
                        
                        settingButtonView("변경 내용", "5배 빨라진 급식 로딩!", true) { }
                    }
                    
                    VStack {
                        Button(action: {
                            isDeveloperInfoToggled.toggle()
                        }) {
                            
                            HStack {
                                Text("개발자 정보")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.text.color)
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                if isDeveloperInfoToggled {
                                    Image("arrow-down")
                                        .padding(.trailing, 10)
                                } else {
                                    Image("setting-arrow")
                                        .padding(.trailing, 10)
                                }
                                
                            }
                            .frame(height: 40)
                            .background(.white)
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                        }
                        
                        if isDeveloperInfoToggled {
                            
                            settingButtonView("개발팀 이름", "대소고 A급 남자들", true) { }
                            
                            settingButtonView("개발자 이름", "이민규", true) { }
                            
                            settingButtonView("개발자 연락처", "mingyu@mingyu.run", true) { }
                        }
                    }
                }
                .padding(.horizontal, 16)
                
            }
        }
    }
}
