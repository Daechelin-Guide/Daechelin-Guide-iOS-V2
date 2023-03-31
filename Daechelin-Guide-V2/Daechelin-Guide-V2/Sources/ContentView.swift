//
//  ContentView.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                NavigationLink(destination: NextView()) {
                    Text("엄준식")
                }
            }
            .navigationTitle("First View")
        }
    }
}
