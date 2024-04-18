//
//  AppClipsApp.swift
//  AppClips
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI
import Observation
import HeroiOS
import HeroShared

@main
struct AppClipsApp: App {
    @State var screenManager = ScreenManager()
    
    var body: some Scene {
        WindowGroup {
            SpeakerListView()
                .environment(screenManager)
        }
    }
}
