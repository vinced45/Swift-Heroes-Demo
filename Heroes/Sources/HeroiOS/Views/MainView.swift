//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import SwiftUI

public struct MainView: View {
    public init() {}
    
    @State var screenManager = ScreenManager()
    
    public var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                content:  {
            SpeakerListView()
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
                .tabItem {
                    Label("Speakers", systemImage: "person.3.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.heroOrange, Color.heroBlue)
            }.tag(1)
            
            ExtensionListView()
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
                .tabItem {
                Label("Extensions", systemImage: "puzzlepiece.extension.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.heroOrange, Color.heroBlue)
            }.tag(2)
        })
    }
}

#Preview {
    MainView()
        .environment(ScreenManager())
}
