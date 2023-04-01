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
