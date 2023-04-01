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
    formatter.dateFormat = "yyyy-MM-dd"
    
    if let date = formatter.date(from: dateString) {
        
        let subtractedDate = date.addingTimeInterval(-86400)
        return formatter.string(from: subtractedDate)
    }
    
    return nil
}

public func add24Hours(from dateString: String) -> String? {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    
    if let date = formatter.date(from: dateString) {
        
        let subtractedDate = date.addingTimeInterval(+86400)
        return formatter.string(from: subtractedDate)
    }
    
    return nil
}
