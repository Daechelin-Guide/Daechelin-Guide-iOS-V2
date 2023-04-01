//
//  CalendarView.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import SwiftUI
import FSCalendar

struct MyCalendarView: UIViewRepresentable {
    
    typealias UIViewType = FSCalendar
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        calendar.scrollDirection = .vertical
        calendar.appearance.headerDateFormat = "YYYY년 MM월"
        calendar.appearance.headerTitleColor = UIColor(Color("textColor"))
        calendar.appearance.headerTitleAlignment = .left
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        return calendar
    }
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {}
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
}
