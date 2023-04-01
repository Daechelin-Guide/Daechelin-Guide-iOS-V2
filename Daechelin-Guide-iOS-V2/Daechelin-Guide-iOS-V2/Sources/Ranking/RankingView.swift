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
                Text("다음 업데이트를 기대해주세요!")
            }
            .refreshable {
                
            }
        }
    }
}

