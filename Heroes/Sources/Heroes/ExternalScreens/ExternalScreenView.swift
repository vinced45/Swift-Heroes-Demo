//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI

public struct ExternalScreenView: View {
    public init() {}
    
    @Environment(ScreenManager.self)
    public var screenManager: ScreenManager
    
    @State var speaker: Speaker = Speaker(id: "1", name: "Alex", image: .alex)
    
    public var body: some View {
        ZStack {
            Color.heroOrange
            
            VStack {
                speaker.image
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Text(speaker.name)
                    .font(.largeTitle)
                    .bold()
            }
        }
        .ignoresSafeArea()
        .onChange(of: screenManager.speaker) { _, newValue in
            speaker = newValue
        }
    }
}
