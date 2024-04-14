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
    #if !os(tvOS) && !os(macOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                MainView()
            } else if #available(macOS 14.0, *) {
                Text("heelo")
            } else if #available(tvOS 17.0, *) {
                Text("heelo")
            } else if #available(watchOS 10.0, *) {
                Text("heelo")
            } else if #available(visionOS 1.0, *){
                Text("")
            } else {
                MainView()
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .background:
                if #available(iOS 17.0, *) {
                    QuickActionsManager.shared.addQuickActions()
                }
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
