//
//  PublicFunction.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI

public func getNowDate() -> String {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd"
    
    let date = Date()
    return dateFormatter.string(from: date)
}

public func isButtonDisabled(_ cnt: Int, _ max: Int) -> Bool {
    if ( cnt != 0 ) && ( cnt <= max ) {
        return false
    } else { return true }
}

public func tabBackgroundDownKeyborad() {
    
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
        keyWindow.endEditing(true)
    }
}

public func minus24Hours(from dateString: String) -> String? {
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    
    if let date = formatter.date(from: dateString) {
        
        let subtractedDate = date.addingTimeInterval(-86400)
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: subtractedDate)
    }
    return nil
}

public func add24Hours(from dateString: String) -> String? {
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMdd"
    
    if let date = formatter.date(from: dateString) {
        
        let subtractedDate = date.addingTimeInterval(86400)
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: subtractedDate)
    }
    return nil

}

public func getDateComponents(from dateString: String) -> [String] {
    
    let dateString = dateString
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ko_KR")
    dateFormatter.dateFormat = "yyyy년 MM월 dd일 E요일"
    guard let date = dateFormatter.date(from: dateString) else {
        fatalError("Invalid date string")
    }

    let calendar = Calendar(identifier: .gregorian)
    let year = calendar.component(.year, from: date)
    let month = calendar.component(.month, from: date)
    let day = calendar.component(.day, from: date)

    let dateComponents = [String(year), String(format: "%02d", month), String(format: "%02d", day)]
    return dateComponents
}
