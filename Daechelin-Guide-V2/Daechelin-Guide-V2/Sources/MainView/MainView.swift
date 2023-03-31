//
//  MainView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

struct MainView: View {
    
    @State var week: String = ""
    @State var breakfast: String = ""
    @State var lunch: String = ""
    @State var dinner: String = ""
    
    @ObservedObject var modal = MainModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                Text("\(week)")
                    .setFont(14, .medium)
                    .frame(width: 160 ,height: 30)
                    .background(.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
                    .autocapitalization(.none)
                
                MenuView("조식", breakfast)
                
                MenuView("중식", lunch)
                
                MenuView("석식", dinner)
            }
            .padding(.horizontal, 16)
            .setBackground()
            .navigationBarItems(
                leading:
                    Image("NavigationBarLogo")
                    .resizable()
                    .frame(width: 129, height: 20),
                
                trailing:
                    HStack(spacing: 10) {
                        Button(action: {
                            
                        }) { Image("ranking") }
                        
                        Button(action: {
                            
                        }) { Image("setting") }
                    }
            )
            
        }
        .navigationBarItems(
            leading:
                Image("NavigationBarLogo")
                .resizable()
                .frame(width: 129, height: 20),
            
            trailing:
                HStack(spacing: 10) {
                    Button(action: {
                        
                    }) { Image("ranking") }
                    
                    Button(action: {
                        
                    }) { Image("setting") }
                }
        )
        .onAppear {
            modal.getData { result in
                guard let result = result else { return }
                
                breakfast = result.data.breakfast!
                lunch = result.data.lunch!
                dinner = result.data.dinner!
                week = result.data.week!
            }
            
        }
        
    }
}
