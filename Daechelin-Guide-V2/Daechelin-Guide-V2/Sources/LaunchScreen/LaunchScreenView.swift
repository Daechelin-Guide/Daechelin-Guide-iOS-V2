//
//  LaunchScreen.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var launched: Bool = false
    
    var body: some View {
        if launched {
            ContentView()
        } else {
            HStack {
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        launched.toggle()
                    }
                }
            }
        }
    }
}
