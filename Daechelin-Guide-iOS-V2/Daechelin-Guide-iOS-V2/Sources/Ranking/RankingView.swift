//
//  RankingView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

struct RankingView: View {
    
    @ObservedObject var model = rankingModel()
    
    @State var rank: [rank] = []
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("대슐랭 랭킹", navigator) {
            
            ScrollView(showsIndicators: false) {
                
                Text("곧 업데이트 예정입니다!")
                    .setFont(18, .medium)
                    .padding(.top, 40)
                Text("아! 그리고 이스터애그가 있으니 찾아보세요 :)")
            }
        }
        .onAppear {
            model.getRankingData { ranking in
                if let ranking = ranking {
                    // 성공적으로 데이터를 받아온 경우
                    rank = ranking
                } else {
                    // 데이터를 받아오는데 실패한 경우
                    print("데이터를 받아오는데 실패했습니다.")
                }
            }
        }
    }
    
}

