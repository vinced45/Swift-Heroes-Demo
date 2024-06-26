//
//  ShareView.swift
//
//
//  Created by Vince Davis on 4/14/24.
//

import Foundation
import SwiftUI
import HeroShared

public struct ShareView: View {
    #if os(iOS)
    public var image: UIImage?
    public var action: (() -> Void)
    public init(image: UIImage? = nil, action: @escaping (() -> Void)) {
        self.image = image
        self.action = action
    }
    #elseif os(macOS)
    public  var image: NSImage?
    public var action: (() -> Void)
    public init(image: NSImage? = nil, action: @escaping (() -> Void)) {
        self.image = image
        self.action = action
    }
    #else
    public  var image: Image?
    public var action: (() -> Void)
    public init(image: Image? = nil, action: @escaping (() -> Void)) {
        self.image = image
        self.action = action
    }
    #endif
    
    public var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue ]), startPoint: .top, endPoint: .bottom)
                
                if let foundImage = image {
                    #if os(iOS)
                    let newImage = Image(uiImage: foundImage)
                    #elseif os(macOS)
                    let newImage = Image(nsImage: foundImage)
                    #else
                    let newImage = foundImage
                    #endif
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
                        
                        newImage.resizable().frame(width: 300, height: 300)
                        Text("Found Image")
                    }
                } else {
                    VStack {
                        Text("Bad Image")
                    }
                }
            }
            .ignoresSafeArea()
            #if os(iOS)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing, content: {
                    Button(action: {
                        action()
                    }, label: {
                        Image(systemName: "x.circle.fill")
                    })
                })
            }
            #endif
        }
    }
}
