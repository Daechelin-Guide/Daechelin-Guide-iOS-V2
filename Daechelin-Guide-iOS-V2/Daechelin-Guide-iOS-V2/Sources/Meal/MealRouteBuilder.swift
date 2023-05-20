//
//  MealRouteBuilder.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import LinkNavigator

struct MealRouteBuilder: RouteBuilder {
    
    var matchPath: String { "meal" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                MealView(mealTime: items.getValue(key: "mealTime") ?? "",
                         menu: items.getValue(key: "menu") ?? "메뉴를 불러오는 중...",
                         localDate: items.getValue(key: "localDate") ?? "",
                         week: items.getValue(key: "week") ?? "",
                         navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
