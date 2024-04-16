//
//  File.swift
//  
//
//  Created by Vince Davis on 4/8/24.
//

import Foundation
import SwiftUI
import HeroShared

public struct ExternalScreenView: View {
    public init() {}
    
    @Environment(ScreenManager.self)
    public var screenManager: ScreenManager
    
    @State var speaker: Speaker = .alex
    
    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange, .heroBlue]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                HStack {
                    Image.logo
                        .resizable()
                        .frame(width: 75, height: 75)
                        .cornerRadius(10.0)
                    
                    Image.wordLogo
                        .resizable()
                        .frame(width: 300, height: 100)
                }
                .padding()
                
                speaker.image
                    .resizable()
                    .frame(width: 250, height: 250)
                    .cornerRadius(15.0)
                
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
