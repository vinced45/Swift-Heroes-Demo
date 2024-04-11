//
//  SwiftUIView.swift
//  
//
//  Created by Vince Davis on 4/7/24.
//

import SwiftUI

public struct SwiftUIView: View {
    public init(action: @escaping (() -> Void)) {
        self.action = action
    }
    public var action: (() -> Void)
    public var body: some View {
        ZStack {
            Rectangle().foregroundColor(.orange)
            VStack {
                Text("Hello, World!")
                Button("Close", action: action)
            }
        }
    }
}

#Preview {
    SwiftUIView(action: {})
}
