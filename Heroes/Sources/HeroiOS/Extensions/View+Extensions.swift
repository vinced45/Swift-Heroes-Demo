//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI
import HeroShared

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
    
    @ViewBuilder
    func ifOS<Content: View>(_ operatingSystems: OperatingSystem...,modifier: (Self) -> Content) -> some View {
        if operatingSystems.contains(OperatingSystem.current) {
            modifier(self)
        } else {
            self
        }
    }

    func modify<T: View>(@ViewBuilder modifier: (Self) -> T) -> T {
        modifier(self)
    }
    
    func customToolBarStyle() -> some View {
        self
        #if os(iOS)
            .toolbarBackground(Color.heroOrange.gradient, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        #endif
    }
}
