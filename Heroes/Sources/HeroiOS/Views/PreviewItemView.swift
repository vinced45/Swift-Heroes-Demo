//
//  SwiftUIView 2.swift
//  
//
//  Created by Vince Davis on 4/15/24.
//

import SwiftUI
import HeroShared

public struct PreviewItemView: View {
    public var identifier: String 
    public init(identifier: String) {
        self.identifier = identifier
    }
    //@State private var speaker: Speaker?
    
    public var body: some View {
        if let speaker = Speaker.all.filter({ $0.id == identifier }).first {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.heroOrange, .heroBlue]), startPoint: .top, endPoint: .bottom)
                
                VStack {
                    HStack {
                        Image.logo
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(15.0)
                        
                        Image.wordLogo
                            .resizable()
                            .frame(height: 150)
                    }
                    .padding()
                    
                    speaker.image
                        .resizable()
                        .frame(width: 300, height: 300)
                        .cornerRadius(15.0)
                    
                    Text(speaker.name)
                        .font(.largeTitle)
                        .bold()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PreviewItemView(identifier: "1")
}
