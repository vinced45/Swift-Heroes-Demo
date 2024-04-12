//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI

// MARK: - iOS Only Extensions
#if os(iOS)
public extension View {
    func externalScreen<ScreenContent>(_ showingExternalScreen: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ExternalScreenViewModifier(showingExternalScreen: showingExternalScreen,  screenContent: screenContent))
    }
    
    func backgroundScreen<ScreenContent>(_ inBackground: Binding<Bool>, screenContent: @escaping () -> ScreenContent) -> some View where ScreenContent: View {
        modifier(ForegroundViewModifier(inBackground: inBackground, screenContent: screenContent))
    }
    
    func externalScreenToolbar(screenManager: ScreenManager, showingSheet: Binding<Bool>) -> some View {
        return self.modifier(ExternalScreenToolBarModifier(screenManager: screenManager, showingSheet: showingSheet))
    }
}
#endif

struct ExternalScreenToolBar: ToolbarContent {
    var screenManager: ScreenManager
    @Binding var showingSheet: Bool

    var body: some ToolbarContent {
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
    }
}

struct ExternalScreenToolBarModifier: ViewModifier {
    var screenManager: ScreenManager
    @Binding var showingSheet: Bool

    func body(content: Content) -> some View {
        return content
            .toolbar {
                ExternalScreenToolBar(screenManager: screenManager, showingSheet: $showingSheet)
            }
    }
}
