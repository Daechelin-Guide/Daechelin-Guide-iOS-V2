//
//  CosmosView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import Cosmos

struct MyCosmosView: UIViewRepresentable {
    @Binding var star: Double
    @Binding var updateOnTouch: Bool
    

    func makeUIView(context: Context) -> CosmosView {
        CosmosView()
    }

    func updateUIView(_ cosmosView: CosmosView, context: Context) {
        cosmosView.rating = star
        cosmosView.settings.filledImage = UIImage(named: "star-filled")
        cosmosView.settings.emptyImage = UIImage(named: "star-empty")
        cosmosView.settings.updateOnTouch = updateOnTouch
        
        cosmosView.settings.starSize = 30
    
        cosmosView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        cosmosView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
