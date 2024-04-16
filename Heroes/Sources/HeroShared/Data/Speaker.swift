//
//  File.swift
//  
//
//  Created by Vince Davis on 4/9/24.
//

import Foundation
import SwiftUI

public struct Speaker: Identifiable, Equatable {
    public init(id: String, name: String, desc: String, image: Image) {
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
    }
    
    public var id: String
    public var name: String
    public var desc: String
    public var image: Image
}

public extension Speaker {
    static var all: [Speaker] {
        return [
            .alex,
            .alberto
        ]
    }
    
    static var alex: Speaker = .init(id: "1", 
                                     name: String(localized: "Alex", table: "Heroes", bundle: .module),
                                     desc: String(localized: "This is Alex", table: "Heroes", bundle: .module),
                                     image: .alex)
    static var alberto: Speaker = .init(id: "2", 
                                        name: String(localized: "Alberto", table: "HeroShared", bundle: .module),
                                        desc: String(localized: "This is Alberto", table: "HeroShared", bundle: .module),
                                        image: .alberto)
}

extension Speaker: Listable {
    public var type: ListType {
        return .speaker
    }
    
    public var title: String {
        self.name
    }
    
    public var subtitle: String {
        self.desc
    }
    
    public var badges: [String] {
        []
    }
}
