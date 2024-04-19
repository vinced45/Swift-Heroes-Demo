//
//  Image.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import SwiftUI

public extension Image {
    static let alberto = Image("alberto", bundle: .module)
    static let alex = Image("alex", bundle: .module)
    static let andrea = Image("andrea", bundle: .module)
    static let andrei = Image("andrei", bundle: .module)
    static let batuhan = Image("batuhan", bundle: .module)
    static let beyza = Image("beyza", bundle: .module)
    static let borbala = Image("borbala", bundle: .module)
    static let brad = Image("brad", bundle: .module)
    static let davide = Image("davide", bundle: .module)
    static let davide2 = Image("davide2", bundle: .module)
    static let emilio = Image("emilio", bundle: .module)
    static let flora = Image("flora", bundle: .module)
    static let gyuree = Image("gyuree", bundle: .module)
    static let jane = Image("jane", bundle: .module)
    static let josip = Image("josip", bundle: .module)
    static let krysztof = Image("krysztof", bundle: .module)
    static let libranner = Image("libranner", bundle: .module)
    static let lukasz = Image("lukasz", bundle: .module)
    static let marcin = Image("marcin", bundle: .module)
    static let marco = Image("marco", bundle: .module)
    static let mete = Image("mete", bundle: .module)
    static let michael = Image("michael", bundle: .module)
    static let natan = Image("natan", bundle: .module)
    static let pedro = Image("pedro", bundle: .module)
    static let peter = Image("peter", bundle: .module)
    static let pietro = Image("pietro", bundle: .module)
    static let pol = Image("pol", bundle: .module)
    static let pradnya = Image("pradnya", bundle: .module)
    static let sara = Image("sara", bundle: .module)
    static let shai = Image("shai", bundle: .module)
    static let stefano = Image("stefano", bundle: .module)
    static let vince = Image("vince", bundle: .module)
    static let vincenzo = Image("vincenzo", bundle: .module)
    static let zach = Image("zach", bundle: .module)
    
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
