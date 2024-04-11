//
//  AppClipsApp.swift
//  AppClips
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI
import Observation
import Heroes

@main
struct AppClipsApp: App {
    @State var screenManager = ScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
        }
    }
}
