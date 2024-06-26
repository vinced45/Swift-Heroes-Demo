//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI
import Combine

#if os(iOS)
import UIKit
#endif

struct ForegroundViewModifier<ScreenContent: View>: ViewModifier where ScreenContent: View {
    @Binding var inBackground: Bool
    let screenContent: () -> ScreenContent
    
    #if os(iOS)
    @Environment(\.scenePhase) var scenePhase
    
    func body(content: Content) -> some View {
        content
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == .inactive {
                    print("Inactive")
                    inBackground = true
                } else if newPhase == .active {
                    print("Active")
                    inBackground = false
                } else if newPhase == .background {
                    print("Background")
                    inBackground = true
                }
            }
            .fullScreenCover(isPresented: $inBackground, content: {
                screenContent()
            })
            .transaction({ transaction in
                transaction.disablesAnimations = true
            })
    }
    #else
    func body(content: Content) -> some View {
        content
    }
    #endif
}
