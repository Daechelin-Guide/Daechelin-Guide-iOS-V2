//
//  LaunchScreen.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import Alamofire

struct LaunchScreenView: View {
    
    @State private var launched: Bool = false
    
    var body: some View {
        if launched {
            MainView()
        } else {
            
            Image("LaunchScreenLogo")
                .resizable()
                .frame(width: 164, height: 140)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                        withAnimation(.easeInOut(duration: 0.7)) {
                            launched.toggle()
                        }
                    }
                }
                .setBackground()
        }
    }
}
