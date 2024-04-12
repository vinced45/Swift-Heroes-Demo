//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import SwiftUI

public struct MainView: View {
    public init() {}
    
    #if os(iOS)
    @State var screenManager = ScreenManager()
    #endif
    public var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/,
                content:  {
            SpeakerListView()
                #if os(iOS)
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
                #endif
                .tabItem {
                    Label("Speakers", systemImage: "person.3.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.heroOrange, Color.heroBlue)
            }.tag(1)
            
            ExtensionListView()
                #if os(iOS)
                .environment(screenManager)
                .externalScreen($screenManager.showScreen) {
                    ExternalScreenView()
                        .environment(screenManager)
                }
                #endif
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
        #if os(iOS)
        .environment(ScreenManager())
        #endif
}
