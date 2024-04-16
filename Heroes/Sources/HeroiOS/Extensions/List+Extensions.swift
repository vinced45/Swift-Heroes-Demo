//
//  File.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import SwiftUI

public extension List {
    func customListStyle() -> some View {
        self
        #if os(iOS)
            .listStyle(.grouped)
        #elseif os(macOS)
            .listStyle(.sidebar)
        #endif
    }
}
