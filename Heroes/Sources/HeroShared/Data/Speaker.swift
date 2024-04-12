//
//  File.swift
//  
//
//  Created by Vince Davis on 4/9/24.
//

import Foundation
import SwiftUI

public struct Speaker: Identifiable, Equatable {
    public init(id: String, name: String, image: Image) {
        self.id = id
        self.name = name
        self.image = image
    }
    
    public var id: String
    public var name: String
    public var image: Image
}

public extension Speaker {
    static var all: [Speaker] {
        return [
            .init(id: "1", name: "Alex", image: .alex),
            .init(id: "2", name: "Alberto", image: .alberto)
        ]
    }
}
