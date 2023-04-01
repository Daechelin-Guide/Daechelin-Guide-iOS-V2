//
//  AppRouteGroup.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import LinkNavigator

struct AppRouterGroup {
    var routers: [RouteBuilder] {
        [
            LaunchScreenRouteBuilder(),
            
            //MARK: 메인
            MainRouteBuilder(),
            MealRouteBuilder(),
            
            
            //MARK: 설정
            SettingRouteBuilder(),
            WebRouteBuilder()
        ]
    }
}

// MARK: getValue extension
extension Dictionary where Key == String, Value == String {
     func getValue(key: String) -> String? {
        first(where: { $0.key == key })?.value as? String
    }
}
