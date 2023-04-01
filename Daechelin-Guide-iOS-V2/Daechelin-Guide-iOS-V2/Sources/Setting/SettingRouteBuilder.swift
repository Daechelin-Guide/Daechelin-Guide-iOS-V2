//
//  SettingRouteBuilder.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import LinkNavigator

struct SettingRouteBuilder: RouteBuilder {
    
    var matchPath: String { "Setting" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                SettingView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
