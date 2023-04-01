//
//  LaunchScreenRouteBuilder.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import LinkNavigator

struct LaunchScreenRouteBuilder: RouteBuilder {
    
    var matchPath: String { "LaunchScreen" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                LaunchScreenView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}

