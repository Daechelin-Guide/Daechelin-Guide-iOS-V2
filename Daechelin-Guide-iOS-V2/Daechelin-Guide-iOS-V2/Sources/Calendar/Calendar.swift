//
//  Calendar.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import LinkNavigator

struct CalendarView: View {
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        
        Navigation("캘린더", navigator) {
            MyCalendarView()
                .padding(.horizontal, 40)
                .padding(.bottom, 80)
        }
    }
}
