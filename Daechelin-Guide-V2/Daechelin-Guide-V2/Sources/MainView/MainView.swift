//
//  MainView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

struct MainView: View {
    
    var breakfast: String = ""
    var lunch: String = ""
    var dinner: String = ""
    
    @ObservedObject var modal = MainModel()
    
    var body: some View {
        
        NavigationView {
            
            MealTimeView("석식")
            MealTimeView("중식")
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
        .onAppear {
            modal.getData { result in
                guard let result = result else { return }
                print(result.data.breakfast!)
            }
        }
        .setBackground()
    }
}
