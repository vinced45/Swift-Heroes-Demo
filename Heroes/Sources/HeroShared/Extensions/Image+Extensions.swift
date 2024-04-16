//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI


public extension Image {
    static let alberto = Image("alberto", bundle: .module)
    static let alex = Image("alex", bundle: .module)
    static let andrea = Image("andrea", bundle: .module)
    
    static let logo = Image("logo", bundle: .module)
    static let wordLogo = Image("wordLogo", bundle: .module)
    
    static let ios3 = Image("ios3", bundle: .module)
    static let ios4 = Image("ios4", bundle: .module)
    static let ios8 = Image("ios8", bundle: .module)
    static let ios9 = Image("ios9", bundle: .module)
    static let ios10 = Image("ios10", bundle: .module)
    static let ios14 = Image("ios14", bundle: .module)
}

public extension Image {
    func styled() -> some View {
        self
            .font(.title2)
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.heroOrange, Color.heroBlue)
    }
    #if os(iOS)
    @MainActor
    func getUIImage(newSize: CGSize) -> UIImage? {
        let image = resizable()
            .scaledToFill()
            .frame(width: newSize.width, height: newSize.height)
            .clipped()
        return ImageRenderer(content: image).uiImage
    }
    #endif
}
