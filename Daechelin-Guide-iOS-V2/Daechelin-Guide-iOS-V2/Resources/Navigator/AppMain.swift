//
//  Daechelin_Guide_V2App.swift
//  Daechelin-Guide-V2
//
//  Created by 이민규 on 2023/03/31.
//

import SwiftUI
import LinkNavigator

// MARK: - AppMain

@main
struct AppMain: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
}

// MARK: App

extension AppMain {
    
    var navigator: LinkNavigator {
        appDelegate.navigator
    }
}

extension AppMain {
    
    var body: some Scene {
        WindowGroup {
            navigator
                .launch(paths: ["LaunchScreen"], items: [:])
            
                .ignoresSafeArea()
                .onOpenURL { url in
                }
        }
    }
}
