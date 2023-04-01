//
//  AppDelegate.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import LinkNavigator

// MARK: - AppDelegate

final class AppDelegate: NSObject {
    let navigator = LinkNavigator(dependency: AppDependency(), builders: AppRouterGroup().routers)
}

// MARK: UIApplicationDelegate

extension AppDelegate: UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        true
    }
}
