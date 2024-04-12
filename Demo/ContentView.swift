//
//  ContentView.swift
//  Demo
//
//  Created by Vince Davis on 4/7/24.
//

import SwiftUI
import CoreSpotlight
import HeroiOS
import HeroShared

struct ContentView: View {
    @Environment(ScreenManager.self) var screenManager: ScreenManager
    var hero: Heroes = .init()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Color.heroOrange)
            Text(hero.test)
            Button(action: {
                hero.testIndex()
            }, label: {
                Text("Index Test")
            })
            if screenManager.showScreen {
                Button(action: {
                    //screenManager.changeText()
                }, label: {
                    Text("Update text")
                })
            }
            Image.alberto
                .resizable()
                .frame(width: 300, height: 300)
        }
        .padding()
        .onContinueUserActivity(CSSearchableItemActionType, perform: handleSpotlight)
    }
    
    func handleSpotlight(_ userActivity: NSUserActivity) {
        if let id = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            print("Found identifier \(id)")
        }
    }
}

#Preview {
    ContentView()
}
