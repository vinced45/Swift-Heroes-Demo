//
//  DemoApp.swift
//  Demo
//
//  Created by Vince Davis on 4/7/24.
//

import SwiftUI
import UserNotifications
import CoreSpotlight
import Observation
import HeroiOS
import HeroShared

@main
struct DemoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .background:
                QuickActionsManager.shared.addQuickActions()
            case .inactive:
                break
            case .active:
                break
            @unknown default:
                break
            }
        }
    }
}
