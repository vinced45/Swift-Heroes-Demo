//
//  ContentView.swift
//  HeroesWatch Watch App
//
//  Created by Vince Davis on 4/11/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Tap Me", action: auth)
        }
        .padding()
        .task {
            let center = UNUserNotificationCenter.current()
            _ = try? await center.requestAuthorization(
                options: [.alert, .sound, .badge]
            )
        }
    }
    
    func auth() {
        task {
            let center = UNUserNotificationCenter.current()
            _ = try? await center.requestAuthorization(
                options: [.alert, .sound, .badge]
            )
        }
    }
}

#Preview {
    ContentView()
}
