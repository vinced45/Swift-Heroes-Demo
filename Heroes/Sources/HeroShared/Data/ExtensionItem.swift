//
//  File.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation
import SwiftUI

public struct ExtensionItem: Identifiable, Equatable {
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

public extension ExtensionItem {
    static var all: [ExtensionItem] {
        return [
            .init(id: "1", 
                  name: "Action",
                  desc: "",
                  image: Image(systemName: "bolt.fill")
                 ),
            .init(id: "2", 
                  name: "Share",
                  desc: "",
                  image: Image(systemName: "square.and.arrow.up")
                 ),
            .init(id: "3",
                  name: "Notification",
                  desc: "",
                  image: Image(systemName: "bell.badge.fill")
                 ),
            .init(id: "4",
                  name: "iMessage",
                  desc: "",
                  image: Image(systemName: "message.fill")
                 ),
            .init(id: "5",
                  name: "Spotlight",
                  desc: "",
                  image: Image(systemName: "magnifyingglass")
                 ),
            .init(id: "6",
                  name: "AppClips",
                  desc: "",
                  image: Image(systemName: "appclip")
                 ),
            .init(id: "7",
                  name: "Quick Actions", 
                  desc: "",
                  image: Image(systemName: "list.bullet")
                 ),
            .init(id: "8",
                  name: "Handoff",
                  desc: "",
                  image: Image(systemName: "macbook.and.iphone")
                 ),
            .init(id: "9",
                  name: "External Screen",
                  desc: "",
                  image: Image(systemName: "tv")
                 ),
        ]
    }
}
