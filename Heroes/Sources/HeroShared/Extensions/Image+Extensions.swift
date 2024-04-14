//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI

// MARK: - Speaker Images
public extension Image {
    static let alberto = Image("alberto", bundle: .module)
    static let alex = Image("alex", bundle: .module)
    static let andrea = Image("andrea", bundle: .module)
}

public extension Image {
    func styled() -> some View {
        self
            .font(.title2)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.heroOrange, Color.heroBlue)
    }
}

public extension List {
    func customListStyle() -> some View {
        self
        #if os(iOS)
            .listStyle(.grouped)
        #endif
    }
}

public extension View {
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
