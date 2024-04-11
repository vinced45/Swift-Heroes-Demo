//
//  ContentView.swift
//  AppClips
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI
import Heroes

struct ContentView: View {
    @Environment(ScreenManager.self) var screenManager: ScreenManager
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Clips")
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
    }
}

#Preview {
    ContentView()
}
