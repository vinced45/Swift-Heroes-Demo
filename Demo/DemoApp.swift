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
import Macros

@main
struct DemoApp: App {
    #if !os(tvOS) && !os(macOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    #endif
    @Environment(\.scenePhase) var scenePhase
    
    @State var inBackground: Bool = false
    
    init() {
        print("Main first")
    }
    
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                if inBackground {
                    BackgroundView()
                } else {
                    //MainView()
                    UserProfileView()
                }
            } else if #available(macOS 14.0, *) {
                MainView()
            } else if #available(tvOS 17.0, *) {
                if inBackground {
                    BackgroundView()
                } else {
                    MainView()
                }
            } else if #available(visionOS 1.0, *){
                MainView()
            } else {
                MainView()
            }
        }
        .onChange(of: scenePhase) { _, newPhase in
            switch newPhase {
            case .background:
                inBackground = true
                if #available(iOS 17.0, *) {
                    QuickActionsManager.shared.addQuickActions()
                }
            case .inactive:
                inBackground = true
            case .active:
                inBackground = false
            @unknown default:
                inBackground = false
            }
        }
    }    
}
