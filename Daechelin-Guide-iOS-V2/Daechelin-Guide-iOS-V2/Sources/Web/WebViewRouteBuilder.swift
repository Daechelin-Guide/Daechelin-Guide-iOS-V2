//
//  WebViewRouteBuilder.swift
//  Daechelin-Guide-iOS-V2
//
//  Created by 이민규 on 2023/04/01.
//

import LinkNavigator

struct WebRouteBuilder: RouteBuilder {
    
    var matchPath: String { "Web" }
    
    var build: (LinkNavigatorType, [String: String], DependencyType) -> MatchingViewController? {
        { navigator, items, dependency in
            return WrappingController(matchPath: matchPath) {
                WebView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
