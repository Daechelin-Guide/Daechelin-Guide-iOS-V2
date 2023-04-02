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
    
    @State var isDeveloperInfoToggled = false
    @State var isVersionInfoToggled = false
    
    @State private var buttonTapCount = 0
    @State private var isDeveloperEastereggView = false
    
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
                        .foregroundColor(Color("textColor"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    Button(action: {
                        isDeveloperInfoToggled.toggle()
                    }) {
                        
                        HStack {
                            Text("현재 버전")
                                .setFont(14, .regular)
                                .foregroundColor(Color("textColor"))
                                .padding(.leading, 10)
                            
                            Spacer()
                            
                            Text("2.0.1")
                                .setFont(14, .regular)
                                .foregroundColor(Color("redTextColor"))
                                .padding(.trailing, 10)
                            
                        }
                        .frame(height: 40)
                        .background(.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                    }
                    
                    VStack {
                        Button(action: {
                            isDeveloperInfoToggled.toggle()
                        }) {
                            
                            HStack {
                                Text("개발자 정보")
                                    .setFont(14, .regular)
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
                            HStack {
                                Text("개발팀 이름")
                                    .setFont(14, .regular)
                                    .foregroundColor(Color("textColor"))
                                    .padding(.leading, 10)
                                
                                Spacer()
                                
                                Text("대소고 A급 남자들")
                                    .setFont(14, .regular)
                                    .foregroundColor(Color("redTextColor"))
                                    .padding(.trailing, 10)
                                
                            }
                            .frame(height: 40)
                            .background(.white)
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                            
                            Button(action: {
                                self.buttonTapCount += 1
                                isDeveloperEastereggView = false
                                
                                if self.buttonTapCount >= 10 {
                                    self.buttonTapCount = 0
                                    
                                    isDeveloperEastereggView = true
                                }
                            }) {
                                
                                HStack {
                                    Text("iOS 개발자 이름")
                                        .setFont(14, .regular)
                                        .foregroundColor(Color("textColor"))
                                        .padding(.leading, 10)
                                    
                                    Spacer()
                                    
                                    Text("이민규")
                                        .setFont(14, .regular)
                                        .foregroundColor(Color("redTextColor"))
                                        .padding(.trailing, 10)
                                    
                                }
                                .frame(height: 40)
                                .background(.white)
                                .cornerRadius(8)
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            if isDeveloperEastereggView == true {
                                VStack {
                                    Image("이스터애그")
                                        .resizable()
                                        .frame(width: 315, height: 420)
                                        .cornerRadius(8)
                                        .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 4 )
                                    
                                    Text("헐 날 찾아주다니... 정말 고마워!!")
                                        .setFont(18, .medium)
                                        .foregroundColor(Color("textColor"))
                                        .padding(.top, 10)
                                }
                                .frame(height: 500)
                                .frame(maxWidth: .infinity)
                                .background(.white)
                                .cornerRadius(8)
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 4 )
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
                
            }
        }
    }
}
