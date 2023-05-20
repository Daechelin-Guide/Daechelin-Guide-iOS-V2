//
//  Color.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/05/18.
//

import SwiftUI

enum Colors {
    
    case breakfast
    case lunch
    case dinner
    case text
    case redText
    case mealday
    case background
    case disable
    
    var color: Color {
        
        switch self {
            
        case .breakfast:
            return Color(hex: 0xFFAF51)
        case .lunch:
            return Color(hex: 0xABC97B)
        case .dinner:
            return Color(hex: 0xCF75CC)
        case .text:
            return Color(hex: 0x333333)
        case .redText:
            return Color(hex: 0xC52222)
        case .mealday:
            return Color(hex: 0xFFD175)
        case .background:
            return Color(hex: 0xF9F9F9)
        case .disable:
            return Color(hex: 0xEFEFEF)
        }
    }
}
