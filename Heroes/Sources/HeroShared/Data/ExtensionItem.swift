//
//  File.swift
//  
//
//  Created by Vince Davis on 4/10/24.
//

import Foundation
import SwiftUI

public struct ExtensionItem: Identifiable, Equatable {
    public init(id: String, name: String, desc: String, image: Image, platforms: [String]) {
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
        self.platforms = platforms
    }

    public var id: String
    public var name: String
    public var desc: String
    public var image: Image
    public var platforms: [String]
}

public extension ExtensionItem {
    static var all: [ExtensionItem] {
        return [
            .init(id: "1", 
                  name: "Action",
                  desc: "",
                  image: Image(systemName: "bolt.fill"),
                  platforms: [.iphone, .ipad, .mac]
                 ),
            .init(id: "2", 
                  name: "Share",
                  desc: "",
                  image: Image(systemName: "square.and.arrow.up"),
                  platforms: [.iphone, .ipad, .mac]
                 ),
            .init(id: "3",
                  name: "Notification",
                  desc: "",
                  image: Image(systemName: "bell.badge.fill"),
                  platforms: [.iphone, .watch, .ipad, .mac, .xr]
                 ),
            .init(id: "4",
                  name: "iMessage",
                  desc: "",
                  image: Image(systemName: "message.fill"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "5",
                  name: "Spotlight",
                  desc: "",
                  image: Image(systemName: "magnifyingglass"),
                  platforms: [.iphone, .ipad, .mac]
                 ),
            .init(id: "6",
                  name: "AppClips",
                  desc: "",
                  image: Image(systemName: "appclip"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "7",
                  name: "Quick Actions", 
                  desc: "",
                  image: Image(systemName: "list.bullet"),
                  platforms: [.iphone, .ipad]
                 ),
            .init(id: "8",
                  name: "Handoff",
                  desc: "",
                  image: Image(systemName: "macbook.and.iphone"),
                  platforms: [.iphone, .watch, .ipad, .mac, .tv, .xr]
                 ),
            .init(id: "9",
                  name: "External Screen",
                  desc: "",
                  image: Image(systemName: "tv"),
                  platforms: [.iphone, .ipad]
                 ),
        ]
    }
}

extension ExtensionItem: Listable {
    public var type: ListType {
        return .extensionItem
    }
    
    public var title: String {
        self.name
    }
    
    public var subtitle: String {
        self.desc
    }
    
    public var badges: [String] {
        self.platforms
    }
}
