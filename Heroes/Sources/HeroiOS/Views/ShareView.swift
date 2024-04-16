//
//  File.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import Foundation
import SwiftUI
import HeroShared

public struct ShareView: View {
//    public init(action: @escaping ((Image?) -> Void)) {
//        self.action = action
//    }
    #if os(iOS)
    public  var image: UIImage?
    public init(image: UIImage? = nil) {
        self.image = image
    }
    #elseif os(macOS)
    public  var image: NSImage?
    public init(image: NSImage? = nil) {
        self.image = image
    }
    #else
    public  var image: Image?
    public init(image: Image? = nil) {
        self.image = image
    }
    #endif
    
    public var body: some View {
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
                    newImage.resizable().frame(width: 300, height: 300)
                    Text("Found Image")
                    //Button("Add", action: { action(newImage) })
                }
            } else {
                VStack {
                    Text("Bad Image")
                    //Button("Close", action: { action(nil) })
                }
            }
        }
    }
}

//#Preview {
//    //ShareView(action: {_ in })
//}
