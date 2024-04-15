//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import SwiftUI
import HeroShared

public struct BackgroundView: View {
    public init() {}
    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue ]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                Image.logo
                    .cornerRadius(15.0)
                
                Image.wordLogo
                    .resizable()
                    .frame(width: 300, height: 150)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
