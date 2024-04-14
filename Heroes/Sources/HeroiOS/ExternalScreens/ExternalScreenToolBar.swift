//
//  File.swift
//  
//
//  Created by Vince Davis on 4/13/24.
//

import SwiftUI

struct ExternalScreenToolBar: ToolbarContent {
    var screenManager: ScreenManager
    @Binding var showingSheet: Bool

    var body: some ToolbarContent {
        #if os(iOS)
        ToolbarItem(placement: .topBarLeading) {
            Text("👓")
                .font(.largeTitle)
        }
        ToolbarItem(placement: .topBarTrailing) {
            if screenManager.showScreen {
                Button(action: {
                    showingSheet = true
                }, label: {
                    Image(systemName: "airplayvideo")
                        .font(.title3)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .blue)
                        .symbolEffect(.pulse.byLayer, isActive: true)
                })
            }
        }
        #else
        ToolbarItem(placement: .automatic) {
            Text("")
                .font(.largeTitle)
        }
        #endif
    }
}
