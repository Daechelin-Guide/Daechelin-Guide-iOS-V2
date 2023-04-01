//
//  MainRouteBuilder.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import LinkNavigator

struct MainRouteBuilder: RouteBuilder {
    var matchPath: String { "Main" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                MainView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
