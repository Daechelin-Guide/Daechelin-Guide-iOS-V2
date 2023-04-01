//
//  RankingView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

struct RankingView: View {
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("대슐랭 랭킹", navigator) {
            
            ScrollView {
                
                VStack {
                    Text("곧 업데이트 예정..!!")
                        .padding(.top, 100)
                    Text("피드백은 DM으로 보내주세요!")
                        .padding(.top, 10)
                    Text("인스타: slowheart._.beat")
                }
            }
        }
    }
}

