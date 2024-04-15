//
//  File.swift
//  
//
//  Created by Vince Davis on 4/14/24.
//

import Foundation
import SwiftUI
import HeroShared

public struct MessageView: View {
    public init(action: @escaping ((Image) -> Void)) {
        self.action = action
    }
    
    let data = (1...20).map { "Item \($0)" }
    
    public var action: ((Image) -> Void)
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
    
    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Button(action: {
                        action(Image.logo)
                    }, label: {
                        Image.logo
                            .resizable()
                            .frame(maxHeight: 100)
                    })
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    MessageView(action: { _ in })
}
