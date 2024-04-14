//
//  File.swift
//  
//
//  Created by Vince Davis on 4/13/24.
//

import SwiftUI

struct ExternalScreenToolBarModifier: ViewModifier {
    var screenManager: ScreenManager
    @Binding var showingSheet: Bool

    func body(content: Content) -> some View {
        #if os(iOS)
        return content
            .toolbar {
                ExternalScreenToolBar(screenManager: screenManager, showingSheet: $showingSheet)
            }
        #else
        return content
        #endif
    }
}
