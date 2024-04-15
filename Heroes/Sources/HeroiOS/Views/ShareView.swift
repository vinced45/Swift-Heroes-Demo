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
    public  var image: UIImage?
    public init(image: UIImage? = nil) {
        self.image = image
    }
    //public var action: ((Image?) -> Void)
    
    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue ]), startPoint: .top, endPoint: .bottom)
            
            if let foundImage = image {
                let newImage = Image(uiImage: foundImage)
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
