//
//  MealRouteBuilder.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import LinkNavigator

struct MealRouteBuilder: RouteBuilder {
    var matchPath: String { "Meal" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                MealView(week: items.getValue(key: "week")!, date: items.getValue(key: "date")!,
                         mealTime: items.getValue(key: "mealTime")!, navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
