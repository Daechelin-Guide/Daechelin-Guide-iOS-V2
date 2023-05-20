//
//  ReviewRouteBuilder.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import LinkNavigator

struct ReviewlRouteBuilder: RouteBuilder {
    
    var matchPath: String { "review" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                ReviewView(mealTime: items.getValue(key: "mealTime")!,
                           localDate: items.getValue(key: "localDate")!,
                           navigator: navigator)
                .navigationBarHidden(true)
            }
        }
    }
}
