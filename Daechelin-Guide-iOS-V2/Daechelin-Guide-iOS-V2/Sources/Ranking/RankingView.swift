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
    
    @State var rank: [Rank] = []
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("대슐랭 랭킹", navigator) {
            
            Text("곧 출시됩니다!")
            
//            ScrollView(showsIndicators: false) {
//
//                ForEach(rank, id: \.self) { rank in
//                    RankingCellView(data: rank)
//                }
//            }
        }
        .onAppear {
            getRank()
            
        }
        .refreshable {
            getRank()
        }
    }
    
    func getRank() {
        model.getRankingData { ranking in
            if let ranking = ranking {
                rank = ranking
                print(rank)
            }
        }
    }
    
}

