//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI

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
