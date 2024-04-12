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

extension Image {
    func styled() -> some View {
        self
            .font(.title2)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.heroOrange, Color.heroBlue)
    }
}
