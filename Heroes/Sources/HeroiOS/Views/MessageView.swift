//
//  MessageView.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import Foundation
import SwiftUI
import HeroShared

struct MessageItem: Hashable {
    let id: UUID = .init()
    let image: Image
    
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}

public struct MessageView: View {
    public init(action: @escaping ((Image, Bool) -> Void)) {
        self.action = action
    }
    
    @State var postAsImage: Bool = true
    
    let items: [MessageItem] = [
        .init(image: .logo),
        .init(image: .wordLogo),
        .init(image: .alex),
        .init(image: .alberto),
        .init(image: .ios3),
        .init(image: .ios4),
        .init(image: .ios8),
        .init(image: .ios9),
        .init(image: .ios10),
        .init(image: .ios14)
    ]
    
    public var action: ((Image, Bool) -> Void)
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    public var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.heroOrange,.heroBlue ]), startPoint: .top, endPoint: .bottom)
            VStack {
                Toggle("Post as Image", isOn: $postAsImage)
                    .bold()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(items, id: \.self) { item in
                            Button(action: {
                                action(item.image, postAsImage)
                            }, label: {
                                item.image
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10.0)
                            })
                        }
                    }
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MessageView(action: { _,_  in })
}
