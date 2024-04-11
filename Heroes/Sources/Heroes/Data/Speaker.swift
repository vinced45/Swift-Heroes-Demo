//
//  File.swift
//  
//
//  Created by Vince Davis on 4/9/24.
//

import Foundation
import SwiftUI

public struct Speaker: Identifiable, Equatable {
    public var id: String
    var name: String
    var image: Image
}

public extension Speaker {
    static var all: [Speaker] {
        return [
            .init(id: "1", name: "Alex", image: .alex),
            .init(id: "2", name: "Alberto", image: .alberto)
        ]
    }
}
